/**
 * Copyright 2016-present, Bkav, Corp.
 * All rights reserved.
 *
 * This source code is licensed under the Bkav license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 *
 * @author monglv@bkav.com on 13/05/2021
 *
 * History:
 * @modifier abc@bkav.com on xx/xx/xxxx đã chỉnh sửa abcxyx (Chỉ các thay đổi quan trọng mới cần ghi lại note này)
 */

'use strict';

import React from 'react';
import MetaView from '../../components/MetaView';

import CategoryView from '../../components/Content/Category/CategoryView';
import LayoutApp from '../../components/Layout/LayoutApp';
// import PropTypes from 'prop-types';

export async function getStaticPaths() {
    return { paths: [], fallback: true };
}

export async function getStaticProps(params) {
    return {
        props: {  id: params['params'].id},
    };
}

function Category({id}) {
    return(
        <div style={{ display: 'flex', flexDirection: 'column' }}>
            <MetaView title={'Danh mục'} />
            <CategoryView id={id}/>
        </div>
    );
}

Category.getLayout = function getLayout(page) {
	return (
		<LayoutApp>
			{page}
		</LayoutApp>
	)
};

export default Category;
