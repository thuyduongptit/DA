

import React, { useState } from 'react';
import classNames from 'classnames';
import { Input, message, Modal } from 'antd';
import { useDispatch } from 'react-redux';
import PropTypes from 'prop-types';

// action
import { post, put } from 'redux/actions/categoryAction';

// component
import UploadFileView from './UploadFileView';

// styles
import styles from './styles/index.module.scss';
import { url_base_img } from '../../../util/TypeUI';

ModalUI.propTypes = {
    setIsModalVisible: PropTypes.func,
    isModalVisible: PropTypes.bool,
    setRootId: PropTypes.func,
    setItemEdit: PropTypes.object,
};

ModalUI.defaultProps = {
    isModalVisible: false,
    rootId: '1',
    setIsModalVisible: () => null,
    setItemEdit: () => null,
};
function ModalUI(props) {
    const { isModalVisible, setIsModalVisible, setItemEdit, itemEdit, rootId, setRootId } = props;
    const dispatch = useDispatch();

    // state
    const [name, setName] = useState('');
    const [description, setDescription] = useState('');

    // ref
    const refUpdateFile = React.useRef(null);

    // const
    const data = {
        rootId: itemEdit ? itemEdit.rootId : rootId,
        status: '1',
        name,
        description,
        sort_order: '1',
    };
    const title = itemEdit ? 'Chỉnh sửa danh mục' : 'Thêm danh mục';

    // handle func
    const handleResetState = () => {
        setDescription('');
        setName('');
        setRootId('1');
        refUpdateFile.current && refUpdateFile.current.setFileList([]);
        refUpdateFile.current && refUpdateFile.current.setLinkFile('');
        itemEdit && setItemEdit(null);
    };

    const handleCancel = () => {
        setIsModalVisible(false);
        handleResetState();
    };

    const handleChangeInputName = (e) => {
        setName(e.target.value);
    };

    const handleChangeInputDescription = (e) => {
        setDescription(e.target.value);
    };

    const handleOk = () => {
        if (name.length > 0) {
            data.icon = refUpdateFile.current ? refUpdateFile.current['linkFile'] : `${url_base_img}operation.png`;
            itemEdit ? dispatch(put({ ...itemEdit, ...data })) : dispatch(post(data));
            handleResetState();
            setIsModalVisible(false);
        } else {
            message.warn('Tên category không được phép bỏ trống');
        }
    };

    React.useEffect(() => {
        !isModalVisible && (refUpdateFile.current = null);
    }, [isModalVisible]);

    React.useEffect(() => {
        if (itemEdit) {
            setRootId(itemEdit.id);
            setName(itemEdit.name);
            setDescription(itemEdit.description);
            refUpdateFile.current.setLinkFile(itemEdit.icon);
            refUpdateFile.current.setFileList([
                {
                    uid: '-1',
                    name: 'image.png',
                    status: 'done',
                    url: `${url_base_img}${itemEdit.icon}`,
                },
            ]);
        }
    }, [itemEdit]);

    return (
        <React.Fragment>
            <Modal
                title={title}
                visible={isModalVisible}
                onOk={handleOk}
                onCancel={handleCancel}
                className={styles.modal_add}
            >
                <div className={classNames('flex_col', styles.category_add)}>
                    {/* name */}
                    <div className={classNames('flex_row', styles.item_category)}>
                        <div className={styles.item_name_category} style={{ color: 'red' }}>
                            Tên(*):
                        </div>
                        <Input value={name} onChange={handleChangeInputName} className={styles.item_input_category} />
                    </div>

                    {/* description */}
                    <div className={classNames('flex_row', styles.item_category)}>
                        <div className={styles.item_name_category}>Nội dung:</div>
                        <Input.TextArea
                            onChange={handleChangeInputDescription}
                            value={description}
                            className={styles.item_input_category}
                        />
                    </div>

                    {/* icon */}
                    <div className={classNames('flex_row', styles.item_category)}>
                        <div className={styles.item_name_category}>Icon:</div>
                        <div className={styles.item_input_category}>
                            <UploadFileView
                                ref={refUpdateFile}
                                styles={styles}
								accept={['image/png', 'image/jpeg']}
                                Img={{ width: '20px', height: '20px' }}
                            />
                        </div>
                    </div>
                </div>
            </Modal>
        </React.Fragment>
    );
}

export default React.memo(ModalUI);
