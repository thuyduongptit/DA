import React from 'react';
import { Breadcrumb } from 'antd';
import PropTypes from 'prop-types';

// Component
import ContentController from './ContentController';


ContentView.propTypes = {
    activeMenu: PropTypes.string.isRequired,
};
function ContentView({ activeMenu, refModalProduct }) {
    return (
        <React.Fragment>
            <Breadcrumb style={{ margin: '10px 0' }}>
                {/*<Breadcrumb.Item>*/}
                {/*    <HomeOutlined />*/}
                {/*</Breadcrumb.Item>*/}
                {/*<Breadcrumb.Item>Bill</Breadcrumb.Item>*/}
            </Breadcrumb>
            <div className='site-layout-background' style={{ padding: 24, minHeight: '95%' }}>
                <ContentController activeMenu={activeMenu} refModalProduct={refModalProduct} />
            </div>
        </React.Fragment>
    );
}

export default ContentView;
