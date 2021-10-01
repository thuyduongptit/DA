/**
 * Copyright 2020 present, Lê Văn Mong.
 * All rights reserved.
 * @author Mongker on 04/05/2021
 * @email: monglv36@gmail.com
 * @student_code: 68DCHT20091
 * @university: UTT (Đại học Công Nghệ Giao Thông Vận Tải)
 */
import React, { useContext } from 'react';
import { Button, Drawer, Form, Input, Checkbox, InputNumber, message, Select } from 'antd';
import PropTypes from 'prop-types';
import useUserBase from '../../../hooks/LogicData/useUserBase';
import useProductBase from '../../../hooks/LogicData/useProductBase';
import { useSelector } from 'react-redux';
import { typeStore, url_base_img } from 'util/TypeUI';
import UploadFileView from '../../Category/UploadFileView';
import styles from './styles/index.module.scss';
import EditerBase from '../../../base/EditerBase';
import { Player } from 'video-react';
import ContextModalProduct from '../../../../context/ContextModalProduct';
import ContextApp from '../../../../context/ContextApp';

// const
const tailLayout = {
    wrapperCol: { offset: 8, span: 16 },
};
const layout = {
    labelCol: { span: 7 },
    wrapperCol: { span: 17 },
};

let dataSale = [];
for (let i = 0; i <= 100; i++) {
    dataSale.push(i);
}
function ModalProductView({ idCategory }) {
    // hooks
    const { myUser } = useUserBase();
    const { postProduct, updateProduct } = useProductBase();
    const category = useSelector((state) => state[typeStore.CATEGORY]);

    // store context
    const {
        typeModal,
        setTypeModal,
        visible,
        setVisible,
        imgFile,
        setImgFile,
        videoFile,
        setVideoFile,
        IdCategory,
        setIdCategory,
        dataEdit,
        // setDataEdit,
        content,
        setContent,
        form,
        refVideoFile,
        refImgFile,
    } = useContext(ContextModalProduct);
    const { keyTreeActive } = React.useContext(ContextApp);

    // const
    const catalog_id =
        (form.getFieldValue() && form.getFieldValue().catalog_id && form.getFieldValue().catalog_id) || keyTreeActive;
    const arr = catalog_id ? category.filter((item) => item.id === catalog_id) : [];
    const nameCategory = arr.length > 0 && arr[0].name;

    // handle func
    const showDrawer = () => {
        setVisible(true);
    };

    const onClose = () => {
        setVisible(false);
        onReset();
    };

    const onReset = () => {
        form.resetFields();
        setImgFile('');
        setVideoFile('');
        setTypeModal('ADD');
        setIdCategory(null);

        refVideoFile.current && refVideoFile.current.setLinkFile('');
        refVideoFile.current && refVideoFile.current.setFileList([]);

        refImgFile.current && refImgFile.current.setLinkFile('');
        refImgFile.current && refImgFile.current.setFileList([]);
        setContent(null);
    };

    const onFill = () => {
        form.setFieldsValue({});
    };

    const onFinish = (values) => {
        if (imgFile && videoFile) {
            values['image_link'] = imgFile;
            values['trailer_link'] = videoFile;
            catalog_id && (values['catalog_id'] = catalog_id);
            myUser &&
                myUser.role === 'teacher' &&
                myUser.categoryFollow &&
                (values['catalog_id'] = myUser.categoryFollow);
            values['content_full'] = content;

            delete values['name_category'];
            if (typeModal === 'ADD') {
                values['author_id'] = myUser.id;
                postProduct(values);
            } else {
                values['id'] = dataEdit.id;
                updateProduct(values);
            }
            onReset();
            onClose();
        } else message.warn('Thiếu file đính kèm');
    };

    const onFinishFailed = (errorInfo) => {
        console.log('Failed:', errorInfo);
    };

    const handleSelect = (optionA, optionB) => {
        return optionA.children.toLowerCase().localeCompare(optionB.children.toLowerCase());
    };

    React.useEffect(() => {
        idCategory && !IdCategory && setIdCategory(idCategory);
    }, [idCategory]);

    React.useEffect(() => {
        dataEdit['content_full'] && setContent(dataEdit['content_full']);
        catalog_id && form.setFieldsValue({ name_category: nameCategory });
    }, [visible, catalog_id]);

    const content_full =
        (form.getFieldValue() && form.getFieldValue().content_full && form.getFieldValue().content_full) || '';

    console.log('form.getFieldValue()', form.getFieldValue()); // MongLV log fix bug

    return (
        <React.Fragment>
            <Drawer
                style={{
                    position: 'absolute',
                }}
                title={typeModal === 'ADD' ? 'Thêm khóa học' : 'Sửa khóa học'}
                placement='right'
                onClose={onClose}
                visible={visible}
                width={'65%'}
            >
                <Form
                    {...layout}
                    form={form}
                    name='basic'
                    initialValues={{ remember: true }}
                    onFinish={onFinish}
                    onFinishFailed={onFinishFailed}
                >
                    <Form.Item
                        label='Tên khóa học'
                        name='name'
                        rules={[{ required: true, message: 'Không được bỏ trống!' }]}
                    >
                        <Input />
                    </Form.Item>
                    <Form.Item
                        label='Nội dung khóa học'
                        name='content'
                        rules={[{ required: true, message: 'Không được bỏ trống!' }]}
                    >
                        <Input.TextArea />
                    </Form.Item>
                    <Form.Item label='Giới thiệu chi tiết' name='content_full'>
                        {visible && <EditerBase content={content_full} setContent={setContent} />}
                    </Form.Item>
                    <Form.Item
                        label='Giá khóa học'
                        name='price'
                        rules={[{ required: true, message: 'Không được bỏ trống!' }]}
                    >
                        <InputNumber
                            style={{ width: 200 }}
                            formatter={(value) => `$ ${value}`.replace(/\B(?=(\d{3})+(?!\d))/g, ',')}
                            parser={(value) => value.replace(/\$\s?|(,*)/g, '')}
                        />
                    </Form.Item>
                    <Form.Item label='Sale khóa học' name='sale'>
                        <Select
                            showSearch
                            style={{ width: 200 }}
                            placeholder='Chọn % giảm giá'
                            optionFilterProp='children'
                            filterOption={(input, option) =>
                                option.children.toLowerCase().indexOf(input.toLowerCase()) >= 0
                            }
                            filterSort={handleSelect}
                        >
                            {dataSale.map((item) => (
                                <Select.Option value={item}>{`${item} %`}</Select.Option>
                            ))}
                        </Select>
                    </Form.Item>
                    <Form.Item label='Ảnh nền' rules={[{ required: true, message: 'Không được bỏ trống!' }]}>
                        <UploadFileView
                            ref={refImgFile}
                            styles={styles}
                            Image={{ width: 260, height: 130 }}
                            callback={setImgFile}
                        />
                    </Form.Item>
                    <Form.Item
                        label='Video Trailer'
                        rules={[{ required: true, message: 'Không được bỏ trống!' }]}
                        callback={setImgFile}
                    >
                        <UploadFileView
                            type={'mp4'}
                            ref={refVideoFile}
                            styles={styles}
                            Image={{ width: 260, height: 130 }}
                            imgDefault={`${url_base_img}video.png`}
                            callback={setVideoFile}
                        />
                    </Form.Item>
                    <Form.Item
                        label='Danh mục'
                        name='name_category'
                        rules={[{ required: true, message: 'Không được bỏ trống!' }]}
                    >
                        <Input disabled />
                    </Form.Item>

                    <Form.Item {...tailLayout}>
                        <Button type='primary' htmlType='submit'>
                            {typeModal === 'ADD' ? 'Thêm' : 'Lưu cập nhật'}
                        </Button>
                    </Form.Item>
                    {videoFile && (
                        <div className={'flex_row'} style={{ justifyContent: 'center', alignItems: 'center' }}>
                            <video style={{ width: 260, height: 130, marginLeft: 20 }} controls>
                                <source src={`${url_base_img}${videoFile}`} type='video/mp4' />
                            </video>
                        </div>
                    )}
                </Form>
            </Drawer>
        </React.Fragment>
    );
}

export default React.memo(ModalProductView);
