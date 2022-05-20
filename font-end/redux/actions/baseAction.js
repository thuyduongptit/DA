/**
 * Copyright 2020 present, Lê Văn Mong.
 * All rights reserved.
 *  on 01/05/2021

 * @university: FBU ( đại học tài chính ngân hàng hà nội)
 */

export default function createActionNoAppID(
    type,
    payload = {},
    original = {},
    condition = {},
) {
    return { type, payload, original, condition, timestamp: Date.now() };
}
