
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
