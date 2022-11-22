

import React from 'react';
import PropTypes from 'prop-types';

// Component
import ContentUNICAView from './UNICA/ContentUNICAView';

// Util
import TypesConfig from 'util/TypesConfig';

function ContentController({ ContentType }) {
    let ContentComponent;
    switch (ContentType) {
        // Note 2: Fix tạm để tạo nhiều dự án setting
        case TypesConfig.UNICA:
            ContentComponent = <ContentUNICAView />;
            break;
        default:
            ContentComponent = <ContentUNICAView />;
            break;
    }
    return ContentComponent;
}

ContentController.propTypes = {
    ContentType: PropTypes.string,
};

ContentController.defaultProps = {
    ContentType: TypesConfig.UNICA,
};

export default ContentController;
