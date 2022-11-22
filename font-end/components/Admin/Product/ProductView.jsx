

import React, { useContext } from 'react';
import TableProduct from './Table/TableProduct';
import { Avatar, Button, Popconfirm, Tag, Tooltip } from 'antd';
import {
    AppstoreOutlined,
    EditOutlined,
    EyeInvisibleOutlined,
    EyeOutlined,
    TeamOutlined,
    UserOutlined,
} from '@ant-design/icons';
import { url_base_img } from '../../../util/TypeUI';
import useUserBase from '../../hooks/LogicData/useUserBase';
import PropTypes from 'prop-types';
import style from '../../hooks/styles/index.module.scss';
import useProductBase from '../../hooks/LogicData/useProductBase';
import ModalStudyProgram from './Modal/ModalStudyProgram';
import useCategoryBase from '../../hooks/LogicData/useCategoryBase';
import ContextModalProduct from '../../../context/ContextModalProduct';

function ProductView({ isMenu, keyTreeActive }) {
    const { usersObj, myUser } = useUserBase();
    const { categoryObj } = useCategoryBase();
    const { hideProduct, getListProduct } = useProductBase();

    // state
    const [visibleStudyProgram, setVisibleStudyProgram] = React.useState(false);
    const [dataProduct, setDataProduct] = React.useState(null);

    // store context
    const { setTypeModal, setVisible, setIdCategory, setDataEdit, form, refVideoFile, refImgFile, setContent } =
        useContext(ContextModalProduct);

    // ref
    const refModalStudyProgram = React.useRef();

    // Vòng đời
    React.useEffect(() => {
        myUser && myUser.role === 'teacher' ? getListProduct({ author_id: Number(myUser.id) }) : getListProduct();
    }, []);

    // handle func
    const handleShow = (data) => {
        if (data) {
            setVisible(true);
            setTypeModal('EDIT');
            setDataEdit(data);
            form.setFieldsValue(data);
            setIdCategory(data.catalog_id);
            if (refVideoFile.current) {
                refVideoFile.current.setLinkFile(data.trailer_link);
                refVideoFile.current.setFileList([
                    {
                        uid: '-1',
                        name: data.trailer_link,
                        status: 'done',
                        url: url_base_img + data.trailer_link,
                    },
                ]);
            }

            if (refImgFile.current) {
                refImgFile.current.setLinkFile(data.image_link);
                refImgFile.current.setFileList([
                    {
                        uid: '-1',
                        name: data.image_link,
                        status: 'done',
                        url: url_base_img + data.image_link,
                    },
                ]);
            }
        }
    };

    // const
    const widthTable = {
        image_link: {
            FullScreen: 100,
            SmallScreen: 100,
        },
        name: {
            FullScreen: 250,
            SmallScreen: 200,
        },
        price: {
            FullScreen: 150,
            SmallScreen: 100,
        },
        sale: {
            FullScreen: 150,
            SmallScreen: 100,
        },
        author_id: {
            FullScreen: 150,
            SmallScreen: 100,
        },
        number_user: {
            FullScreen: 150,
            SmallScreen: 100,
        },
    };
    const typeWidthTable = isMenu ? 'FullScreen' : 'SmallScreen';

    // handle func
    const showDrawer = (data) => {
        if (refModalStudyProgram.current) {
            refModalStudyProgram.current.setDataProduct(data);
            refModalStudyProgram.current.showDrawer(true);
        }
    };

    const showDrawerAdd = () => {
        setVisible(true);
        setContent(null);
        categoryObj &&
            categoryObj[myUser.categoryFollow] &&
            categoryObj[myUser.categoryFollow].name &&
            form.setFieldsValue({
                name_category: categoryObj[myUser.categoryFollow].name,
            });
    };

    // JSX
    const columnsTable = [
        {
            title: 'Ảnh Khóa Học',
            dataIndex: 'image_link',
            width: widthTable.image_link[typeWidthTable],
            render: (image_link) => {
                <Avatar style={{ backgroundColor: '#87d068' }} icon={<UserOutlined />} src={''} />;
                return (
                    <Avatar
                        icon={<UserOutlined />}
                        src={url_base_img + (image_link ? image_link : 'default.png')}
                        style={{ width: 100, height: 100 }}
                    />
                );
            },
        },
        {
            title: 'Tên khóa học',
            dataIndex: 'name',
            width: widthTable.name[typeWidthTable],
            render: (name) => <div style={{ color: 'red', fontSize: 15, fontWeight: 'bold' }}>{name}</div>,
        },
        {
            title: 'Giá khóa học',
            dataIndex: 'price',
            width: widthTable.price[typeWidthTable],
            render: (price) => <a>{price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')} $</a>,
        },
        {
            title: 'Giảm giá',
            dataIndex: 'sale',
            width: widthTable.sale[typeWidthTable],
            render: (sale) => <Tag color='success'>{sale} %</Tag>,
        },
        {
            title: 'Tác giả',
            dataIndex: 'author_id',
            width: widthTable.author_id[typeWidthTable],
            // render: (author_id) => <div>{usersObj[author_id].name}</div>,
            render: (author_id) => (
                <div className={'flex_col'} style={{ justifyContent: 'center', alignItems: 'center' }}>
                    <div className={'flex_row'} style={{ justifyContent: 'center', alignItems: 'center' }}>
                        <Avatar icon={<UserOutlined />} src={url_base_img + usersObj[author_id].avatar} />
                        <p style={{ marginLeft: 3, fontWeight: 'bold' }}>{usersObj[author_id].name}</p>
                    </div>
                    <p>({usersObj[author_id].email})</p>
                </div>
            ),
        },
    ];

    const actionProduct = (_, data) => {
        return (
            <div className={style.action}>
                <EditOutlined onClick={() => handleShow(data)} className={style.item_action} />
                <Tooltip title='Quản trị chương trình học'>
                    <AppstoreOutlined
                        onClick={() => showDrawer(data)}
                        className={style.item_action}
                        style={{ color: 'blue' }}
                    />
                </Tooltip>
                {data.status ? (
                    <Popconfirm
                        placement='top'
                        title={'Ẩn khóa học đi'}
                        onConfirm={() => hideProduct(data)}
                        okText='Phải'
                        cancelText='Không'
                    >
                        <EyeOutlined style={{ color: '#0b8f01' }} className={style.item_action} />
                    </Popconfirm>
                ) : (
                    <Popconfirm
                        placement='top'
                        title={'Hiễn thị khóa học'}
                        onConfirm={() => hideProduct(data)}
                        okText='Phải'
                        cancelText='Không'
                    >
                        <EyeInvisibleOutlined style={{ color: '#fc0000' }} />
                    </Popconfirm>
                )}
            </div>
        );
    };
    const columnsTableOfMenu = [
        {
            title: 'Học viên',
            dataIndex: 'number_user',
            width: widthTable.number_user[typeWidthTable],
            render: (number_user) => (
                <div className={'flex_row'} style={{ alignItems: 'center' }}>
                    <TeamOutlined style={{ fontSize: 14 }} />
                    <p style={{ marginLeft: 3 }}>{number_user}</p>
                </div>
            ),
        },
    ];

    const _columnsTable = isMenu ? columnsTable.concat(columnsTableOfMenu) : columnsTable;
    return (
        <React.Fragment>
            {myUser.role === 'teacher' && (
                <Button type='primary' onClick={showDrawerAdd} style={{ marginBottom: 5, borderRadius: 20 }}>
                    Thêm khóa học
                </Button>
            )}
            <TableProduct
                columnsTable={_columnsTable}
                actionProduct={actionProduct}
                type={keyTreeActive}
                isFullWidth={isMenu}
            />
            <ModalStudyProgram ref={refModalStudyProgram} />
        </React.Fragment>
    );
}

ProductView.propTypes = {
    isMenu: PropTypes.bool, // Note: biến này sử dụng để check xem nó đang đứng ở Menu của Quản lý khóa học hay không
};

ProductView.defaultProps = {
    isMenu: false,
};

export default React.memo(ProductView);
