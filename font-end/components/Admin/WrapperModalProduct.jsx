/**
 * Copyright 2016-present, Bkav, Corp.
 * All rights reserved.
 *
 * This source code is licensed under the Bkav license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 *
 * @author monglv@bkav.com on 01/10/2021
 *
 * History:
 * @modifier abc@bkav.com on xx/xx/xxxx đã chỉnh sửa abcxyx (Chỉ các thay đổi quan trọng mới cần ghi lại note này)
 */

'use strict';

import React from 'react';
// import PropTypes from 'prop-types';
import ContextModalProduct from 'context/ContextModalProduct';
import { Form } from 'antd';

function WrapperModalProduct({ children }) {
    const [typeModal, setTypeModal] = React.useState('ADD'); // Note: type này để xác "EDIT" sửa hay "ADD"
    const [visible, setVisible] = React.useState(false);
    const [imgFile, setImgFile] = React.useState('');
    const [videoFile, setVideoFile] = React.useState('');
    const [IdCategory, setIdCategory] = React.useState(null);
    const [dataEdit, setDataEdit] = React.useState({}); // Note: dành cho trạng thái typeModal === "EDIT"
    const [content, setContent] = React.useState('');

    // ref
    const refImgFile = React.useRef(null);
    const refVideoFile = React.useRef(null);

    // hooks
    const [form] = Form.useForm();

    const _setTypeModal = React.useCallback((value) => setTypeModal(value), [typeModal]);
    const _setVisible = React.useCallback((value) => setVisible(value), [visible]);
    const _setImgFile = React.useCallback((value) => setImgFile(value), [imgFile]);
    const _setVideoFile = React.useCallback((value) => setVideoFile(value), [videoFile]);
    const _setIdCategory = React.useCallback((value) => setIdCategory(value), [IdCategory]);
    const _setDataEdit = React.useCallback((value) => setDataEdit(value), [dataEdit]);
    const _setContent = React.useCallback((value) => setContent(value), [content]);

    const data = React.useMemo(
        () => ({
            typeModal,
            setTypeModal: _setTypeModal,
            visible,
            setVisible: _setVisible,
            imgFile,
            setImgFile: _setImgFile,
            videoFile,
            setVideoFile: _setVideoFile,
            IdCategory,
            setIdCategory: _setIdCategory,
            dataEdit,
            setDataEdit: _setDataEdit,
            content,
            setContent: _setContent,
            form,
        }),
        [content, dataEdit, IdCategory, videoFile, imgFile, visible, typeModal, form],
    );
    return (
        <ContextModalProduct.Provider value={{ ...data, refVideoFile, refImgFile }}>
            {children}
        </ContextModalProduct.Provider>
    );
}

export default WrapperModalProduct;
