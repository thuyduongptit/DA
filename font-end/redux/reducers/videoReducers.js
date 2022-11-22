

import typeAction from 'redux/actions/typeAction';

function Video(video = [], action) {
    switch (action.type) {
        case typeAction.VIDEO.GET_LIST:
            return action.payload.data;
        case typeAction.VIDEO.POST:
            return action.payload.data;
        case typeAction.VIDEO.PUT:
            return action.payload.data;
        case typeAction.VIDEO.DEL:
            return action.payload.data;
        default:
            return video;
    }
}

export default Video;
