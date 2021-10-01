/**
 * Copyright 2020 present, Lê Văn Mong.
 * All rights reserved.
 * @author Mongker on 01/05/2021
 * @email: monglv36@gmail.com
 * @student_code: 68DCHT20091
 * @university: UTT (Đại học Công Nghệ Giao Thông Vận Tải)
 */

import React from 'react';
import PropTypes from 'prop-types';
import { Map } from 'immutable';
import { EditOutlined, AppstoreAddOutlined, DeleteOutlined } from '@ant-design/icons';
import { useDispatch } from 'react-redux';

// action
import { remove } from 'redux/actions/categoryAction';

// styles
import styles from './styles/index.module.scss';
import ImmutablePropTypes from 'react-immutable-proptypes';

TitleTreeView.propTypes = {
    item: ImmutablePropTypes.map,
    showModalAdd: PropTypes.func,
    showModalEdit: PropTypes.func,
    isDelete: PropTypes.bool,
};

TitleTreeView.defaultProps = {
    item: Map(),
    showModalAdd: () => null,
    showModalEdit: () => null,
    isDelete: true,
};
function TitleTreeView({ item, showModalAdd, showModalEdit, isDelete }) {
    // redux
    const dispatch = useDispatch();

    // handle func
    const onDelete = (id, event) => {
        event.stopPropagation();
        dispatch(remove(id));
    };

    return (
        <div style={{ width: 'auto' }} className={styles.controller}>
            <div style={{ fontSize: 15 }}>{item.name}</div>
            <div style={{ fontSize: '25px' }} className={styles.event}>
                <div className={styles.event_item} onClick={(event) => showModalAdd(item, event)}>
                    <AppstoreAddOutlined />
                </div>
                <div className={styles.event_item} onClick={(event) => showModalEdit(item, event)}>
                    <EditOutlined />
                </div>
                {isDelete && (
                    <div className={styles.event_item} onClick={(event) => onDelete(item.id, event)}>
                        <DeleteOutlined />
                    </div>
                )}
            </div>
        </div>
    );
}

export default TitleTreeView;
