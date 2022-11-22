

'use strict';

import React from 'react';
import PropTypes from 'prop-types';
import VideoPlayBase from '../../../base/VideoPlayBase';
import useStudyProgramBase from '../../../hooks/LogicData/useStudyProgramBase';
import useProductBase from '../../../hooks/LogicData/useProductBase';

function ContentRight({ itemVideo, id_study_program, product_id }) {
    const { studyProgramObj } = useStudyProgramBase();
    const { productObj } = useProductBase();
    if (itemVideo)
        return (
            <div>
                <VideoPlayBase image_link={itemVideo.img} trailer_link={itemVideo.link_video} />
            </div>
        );
    if (id_study_program)
        return (
            <div className={'flex_col'} style={{ justifyContent: 'center', alignItems: 'center' }}>
                <div
                    style={{
                        fontSize: 24,
                        fontWeight: 'bold',
                        margin: 10,
                    }}
                >
                    {studyProgramObj[id_study_program].name}
                </div>
                <div style={{ margin: '10px 20px' }}>
                    <div dangerouslySetInnerHTML={{ __html: studyProgramObj[id_study_program].content }} />
                </div>
            </div>
        );
    return (
        <div className={'flex_col'} style={{ justifyContent: 'center', alignItems: 'center', margin: 20 }}>
            <div dangerouslySetInnerHTML={{ __html: productObj[product_id].content_full }} />
        </div>
    );
}

ContentRight.propTypes = {
    itemVideo: PropTypes.object,
    id_study_program: PropTypes.number,
};

ContentRight.defaultProps = {
    itemVideo: null,
};

export default ContentRight;
