/**
 * Copyright 2020 present, Lê Văn Mong.
 * All rights reserved.
 *  on 05/05/2021

 * @university: FBU ( đại học tài chính ngân hàng hà nội)
 */

import typeAction from 'redux/actions/typeAction';

function StudyProgram(studyprogram = [], action) {
    switch (action.type) {
        case typeAction.STUDY_PROGRAM.GET_LIST:
            return action.payload.data;
        case typeAction.STUDY_PROGRAM.POST:
            return action.payload.data;
        case typeAction.STUDY_PROGRAM.PUT:
            return action.payload.data;
        case typeAction.STUDY_PROGRAM.DEL:
            return action.payload.data;
        default:
            return studyprogram;
    }
}

export default StudyProgram;
