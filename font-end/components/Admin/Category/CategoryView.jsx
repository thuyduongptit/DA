/**
 * Copyright 2020 present, Lê Văn Mong.
 * All rights reserved.
 * @author Mongker on 23/04/2021
 * @email: levanmong.dola.99@gmail.com
 * @phone: +84373668113
 * @slogan: "Mọi thứ đều bắt đầu từ việc nhỏ, những khát vọng phải lớn"
 */

import React, { useContext, useState } from 'react';
import { Button, Tree } from 'antd';
import { useDispatch } from 'react-redux';

// action
import * as categoryAction from 'redux/actions/categoryAction';

// component
import ModalUI from './ModalUI';

// styles
import styles from './styles/index.module.scss';
import TitleTreeView from './TitleTree/TitleTreeView';
import { url_base_img } from '../../../util/TypeUI';
import ProductView from '../Product/ProductView';
import useCategoryBase from '../../hooks/LogicData/useCategoryBase';
import ContextApp from '../../../context/ContextApp';
import ContextModalProduct from '../../../context/ContextModalProduct';

const CategoryView = ({ refModalProduct }) => {
    // redux
    const dispatch = useDispatch();
    const { category, categoryObj } = useCategoryBase();
    const { keyTreeActive, setKeyTreeActive } = React.useContext(ContextApp);

    // store context
    const { setVisible } = useContext(ContextModalProduct);

    // state
    const [treeData, setTreeData] = useState([]);
    const [itemEdit, setItemEdit] = useState(null);
    const [isModalVisible, setIsModalVisible] = useState(false);
    const [rootId, setRootId] = useState('1');

    // callback
    const _setIsModalVisible = React.useCallback((isValue = false) => setIsModalVisible(isValue), [isModalVisible]);
    const _setItemEdit = React.useCallback((value) => setItemEdit(value), [itemEdit]);
    const _setRootId = React.useCallback((value) => setRootId(value), [rootId]);

    // const
    const urlImg = url_base_img;

    // handle func
    const onSelect = (selectedKeys, info) => {
        setKeyTreeActive(selectedKeys[0]);
    };

    const showModalAdd = (item, event) => {
        event.stopPropagation();
        setIsModalVisible(true);
        setRootId(item.id);
    };

    const showModalEdit = (item, event) => {
        event.stopPropagation();

        setItemEdit(item);
        setIsModalVisible(true);
        setRootId(item.id);
    };

    const setChildren = (id, key) => {
        const children = [];
        let dem = 0;
        category.map((itemChildren) => {
            if (`${itemChildren.rootId}` === `${id}`) {
                const _key = `${key}-${dem}`;
                const img = itemChildren.icon ? `${urlImg}${itemChildren.icon}` : urlImg + 'operation.png';
                children.push({
                    title: (
                        <TitleTreeView item={itemChildren} showModalAdd={showModalAdd} showModalEdit={showModalEdit} />
                    ),
                    // title: itemChildren.name,
                    key: itemChildren.id,
                    icon: <img src={img} alt={'icon'} style={{ width: 20, height: 17, objectFit: 'cover' }} />,
                    children: setChildren(itemChildren.id, _key.toString()),
                });
                dem = dem + 1;
            }
        });
        return children;
    };
    const updateTreeData = () => {
        let newTreeData = [];
        let dem = 0;
        category.map((item) => {
            const img = item.icon ? `${urlImg}${item.icon}` : urlImg + 'operation.png';
            const children = setChildren(item.id, `${dem}`);
            if (`${item.rootId}` === '1') {
                newTreeData.push({
                    title: (
                        <TitleTreeView
                            item={item}
                            showModalAdd={showModalAdd}
                            showModalEdit={showModalEdit}
                            isDelete={!children.length > 0}
                        />
                    ),
                    key: item.id,
                    icon: <img src={img} alt={'icon'} style={{ width: 20, height: 17, objectFit: 'cover' }} />,
                    children: children,
                });
                dem = dem + 1;
            }
        });
        setTreeData(newTreeData);
    };

    // Xử lý vòng đời
    React.useEffect(() => {
        dispatch(categoryAction.getList());
    }, []);

    React.useEffect(() => {
        updateTreeData();
    }, [category]);

    return (
        <React.Fragment>
            <div
                className={'flex_row'}
                style={{ justifyContent: 'space-between', alignItems: 'center', marginBottom: '5px' }}
            >
                <div className={styles.btn_add_category}>
                    <Button type='primary' onClick={() => _setIsModalVisible(true)}>
                        Thêm danh mục
                    </Button>
                </div>
                <h2 style={{ fontWeight: 'bold' }}>
                    Danh sách{' '}
                    {keyTreeActive && categoryObj[keyTreeActive] && categoryObj[keyTreeActive].name
                        ? categoryObj[keyTreeActive].name
                        : 'ALL'}
                </h2>
                {keyTreeActive ? (
                    <div className={styles.btn_add_category}>
                        <Button type='primary' onClick={() => setVisible(true)}>
                            Thêm khóa học
                        </Button>
                    </div>
                ) : (
                    <div />
                )}
            </div>
            <div className={'flex_row'}>
                <ModalUI
                    isModalVisible={isModalVisible}
                    setIsModalVisible={_setIsModalVisible}
                    itemEdit={itemEdit}
                    setItemEdit={_setItemEdit}
                    rootId={rootId}
                    setRootId={_setRootId}
                />
                <div className={styles.custom_tree_antd}>
                    <Tree onSelect={onSelect} treeData={treeData} showIcon draggable />
                </div>
                <ProductView keyTreeActive={keyTreeActive} />
            </div>
        </React.Fragment>
    );
};

CategoryView.propTypes = {};

CategoryView.defaultProps = {};

export default CategoryView;
