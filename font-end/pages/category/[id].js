

'use strict';

import React from 'react';
import MetaView from '../../components/MetaView';

import CategoryView from '../../components/Content/Category/CategoryView';
import LayoutApp from '../../components/Layout/LayoutApp';
// import PropTypes from 'prop-types';

export async function getServerSideProps(context) {
	const { params } = context;
	return { props: {  id: params.id } };
}

function Category({id}) {
    return(
		<LayoutApp>
			<div style={{ display: 'flex', flexDirection: 'column' }}>
				<MetaView title={'Danh mục'} />
				<CategoryView id={id}/>
			</div>
		</LayoutApp>
    );
}


export default Category;
