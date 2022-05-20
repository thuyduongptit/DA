/**
 * Copyright 2020 present,Lê Văn Mong.
 * All rights reserved.
 *  on 14/07/2021

 * @university: FBU ( đại học tài chính ngân hàng hà nội)
 */

export default function validateEmail(email) {
    const re =
        /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}
