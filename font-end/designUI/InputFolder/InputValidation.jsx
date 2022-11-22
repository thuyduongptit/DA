
'use strict';

import React from 'react';
import PropTypes from 'prop-types';
import { Input, Tooltip } from 'antd';

import styles from './styles/index.module.scss';

InputValidation.propTypes = {
    onChange: PropTypes.func,
    value: PropTypes.string,
    placement: PropTypes.string,
    className: PropTypes.string,
    placeholder: PropTypes.string,
    type: PropTypes.string,
    disabled: PropTypes.bool,
    visible: PropTypes.bool,
};

InputValidation.defaultProps = {
    onChange: () => null,
    value: '',
    placement: 'right',
    disabled: false,
    visible: false,
    classNameTooltip: styles.customTooltip,
    className: '',
    placeholder: '',
    type: '',
};

function InputValidation({
    onChange,
    value,
    disabled,
    title,
    placement,
    visible,
    className,
    placeholder,
    classNameTooltip,
    type,
}) {
    const [isShow, setIsShow] = React.useState(false);

    const handleShowTooltip = React.useCallback(() => setIsShow(true), []);
    const handleHideTooltip = React.useCallback(() => setIsShow(false), []);

    React.useEffect(() => {
        handleHideTooltip();
    }, []);
    return (
        <Tooltip placement={placement} title={title} visible={isShow && visible} overlayClassName={classNameTooltip}>
            {type === 'password' ? (
                <Input.Password
                    onChange={onChange}
                    value={value}
                    disabled={disabled}
                    onFocus={handleHideTooltip}
                    onBlur={handleShowTooltip}
                    placeholder={placeholder}
                    className={className}
                    type={type}
                />
            ) : (
                <Input
                    onChange={onChange}
                    value={value}
                    disabled={disabled}
                    onFocus={handleHideTooltip}
                    onBlur={handleShowTooltip}
                    placeholder={placeholder}
                    className={className}
                />
            )}
        </Tooltip>
    );
}

export default React.memo(InputValidation);
