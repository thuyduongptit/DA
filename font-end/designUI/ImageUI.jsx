/**
 * Copyright 2020 present, Lê Văn Mong.
 * All rights reserved.
 *  on 26/07/2021

 * @university: FBU ( đại học tài chính ngân hàng hà nội)
 */

import React from 'react';
import PropTypes from 'prop-types';
import styled from 'styled-components';
import { Image } from 'antd';

const ImageCustom = styled(Image)`
    ${(props) => props.styled && props.styled.length > 0 && props.styled}
`;
function ImageUI(props) {
    return <ImageCustom {...props} />;
}

ImageUI.propTypes = {
    preview: PropTypes.bool,
    src: PropTypes.string,
    styles: PropTypes.object,
};

ImageUI.defaultProps = {
    preview: false,
    src: '',
    style: {},
};

export default React.memo(ImageUI);
