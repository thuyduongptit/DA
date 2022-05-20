/**
 * Copyright 2020 present, Lê Văn Mong.
 * All rights reserved.
 *  on 04/05/2021

 * @university: FBU ( đại học tài chính ngân hàng hà nội)
 */
import React from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { typeStore, url_api } from '../../../util/TypeUI';
import baseAPI from 'redux/api/baseAPI';
import typeAction from 'redux/actions/typeAction';
import { message as messageAnt } from 'antd';
// import PropTypes from 'prop-types';

function useCategoryBase() {
    const category = useSelector((state) => state[typeStore.CATEGORY]);
    const dispatch = useDispatch();

    let categoryObj = {};
    category.map((item) => (categoryObj[item.id] = item));

    // func handle
    const getListCategory = async (obj = {}) => {
        const { message, categories } = await baseAPI.getAll(url_api.CATEGORY, obj);
        if (message === 'OK') {
            dispatch({
                type: typeAction.CATEGORY.GET,
                payload: { category: [...categories] },
            });
        } else messageAnt.warn(message);
    };
    return {
        category,
        categoryObj,
        getListCategory,
    };
}

useCategoryBase.propTypes = {};

useCategoryBase.defaultProps = {};

export default useCategoryBase;
