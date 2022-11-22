
'use strict';

import React from 'react';
import NoiDung from '../NoiDungKH/NoiDung';
// import PropTypes from 'prop-types';
import ContentRight from './ContentRight';

// styles
import styles from './styles.module.scss';

function WachVideoOpen({ id_product, headComponent }) {
    // state
    const [itemVideo, setItemVideo] = React.useState(null);
    const [keyActive, setKeyActive] = React.useState(null);

    // func handle
    const onChangeCollapse = (key) => {
        setItemVideo(null);
        setKeyActive(key);
    };
    const onChangeVideo = (item) => {
        setItemVideo(item);
        setKeyActive(null);
    };

    return (
        <div className={'flex_col'}>
            {headComponent}
            <div className={'flex_row'} style={{ height: '100%' }}>
                <div className={styles.content_left}>
                    <div className={styles.title}>Lộ trình khóa học</div>
                    <NoiDung
                        product_id={id_product}
                        onChangeCollapse={onChangeCollapse}
                        isButton={false}
                        onChangeVideo={onChangeVideo}
                        idVideoActive={itemVideo && itemVideo.id}
                    />
                </div>
                <div className={styles.content_right}>
                    <ContentRight itemVideo={itemVideo} id_study_program={keyActive} product_id={id_product} />
                </div>
            </div>
        </div>
    );
}

WachVideoOpen.propTypes = {};

WachVideoOpen.defaultProps = {};

export default WachVideoOpen;
