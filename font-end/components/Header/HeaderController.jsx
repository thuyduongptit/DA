

import React from 'react';
import PropTypes from 'prop-types';

// component
import HeaderUNICAView from './UNICA/HeaderUNICAView';

// Util
import TypesConfig from 'util/TypesConfig';

function HeaderController(props) {
    const {TypeHeader} = props;
    let HeaderComponent;
    switch (TypeHeader) {
        // Note 1: đang viết tạm để tạo base header
        case TypesConfig.UNICA:
            HeaderComponent = <HeaderUNICAView />;
            break;
        default:
            HeaderComponent = <HeaderUNICAView />;
            break;
    }
    return HeaderComponent;
}

HeaderController.propTypes = {
    TypeHeader: PropTypes.string,
};

HeaderController.defaultProps = {
    TypeHeader: TypesConfig.UNICA,
};

export default HeaderController;
