

import React from 'react';
// import PropTypes from 'prop-types';
function useWindowSize() {
    const [windowSize, setWindowSize] = React.useState({
        heightApp: null,
        widthApp: null,
    });

    React.useEffect(() => {
        setWindowSize({
            heightApp: window.innerHeight,
            widthApp: window.innerWidth,
        });
    }, []);

    return { height: windowSize.heightApp, width: windowSize.widthApp };
}

useWindowSize.propTypes = {};

useWindowSize.defaultProps = {};

export default useWindowSize;
