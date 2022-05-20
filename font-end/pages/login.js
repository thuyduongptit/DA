/**
 * Copyright 2020 present, Lê Văn Mong.
 * All rights reserved.
 *  on 19/03/2021

 * @university: FBU ( đại học tài chính ngân hàng hà nội)
 */

import React from 'react';
// import PropTypes from 'prop-types';
import style from 'styles/login.module.scss';
import styled from 'styled-components';
import { useRouter } from 'next/router';
import { message } from 'antd';
import axios from 'axios';

// Context
import ContextApp from '../context/ContextApp';

// Component
import MetaView from '../components/MetaView';
import { url_api, url_base } from '../util/TypeUI';
import * as PropTypes from 'prop-types';
import validateEmail from '../util/function/validateEmail';
import InputValidation from '../designUI/InputFolder/InputValidation';
// const style
const InputValidationCustom = styled(InputValidation)`
    border-radius: 20px;
    font-size: 18px;
`;
const getLoginUser = async (data, dataUser) => {
    try {
        return axios
            .post(`${url_base}${url_api.USER}/login`, data)
            .then((res) => res.data)
            .then((result) => {
                console.log('result', result); // MongLV log fix bug
                // dataUser(res.data['user']);
                if (result.message === 'OK') {
                    console.log('message', result.message); // MongLV log fix bug
                    dataUser(result['user']);
                } else {
                    message.warning(result.message);
                }
            })
            .catch((error) => message.error('Lỗi đường truyền, kiểm tra lại mạng:', error));
    } catch (e) {
        message.error(e);
    }
};

function Login(props) {
    // state
    const [email, setEmail] = React.useState('');
    const [password, setPassword] = React.useState('');

    // context
    const { user, setUser } = React.useContext(ContextApp);

    const router = useRouter();

    // handle func
    const handleChangeEmail = (e) => {
        setEmail(e.target.value);
    };
    const handleChangePassword = (e) => {
        setPassword(e.target.value);
    };

    const handleSave = () => {
        if (email.length > 0 && password.length > 0) {
            getLoginUser(
                {
                    email: email,
                    password: password,
                },
                setUser,
            );
        } else message.warn('Không được bỏ trống thông tin');
    };
    const handleSingUp = (e) => {
        e.preventDefault();
        router.push('/singup');
    };

    function handleValidateEmail() {
        if (email.length === 0) return false;
        return validateEmail(email);
    }
    function handleValidatePass(password) {
        if (password.length === 0) return false;
        else if (password.length < 6) return false;
        return true;
    }
    React.useEffect(() => {
        user && router.push('/');
    }, [user]);
    return (
        <React.Fragment>
            <MetaView title={'Login -  FBU Learning'} />
            <div className={style.limiter}>
                <div className={style.container_login}>
                    <div className={`${style.text_center} ${style.form_group}`} onClick={() => router.push('/')}>
                        FBU Learning
                    </div>
                    <div className={style.login}>
                        <div className={style.form_login}>
                            <div className={style.title}>
                                <h3>ĐĂNG NHẬP</h3>
                            </div>
                            <div className={style.wrap_input}>
                                <InputValidationCustom
                                    onChange={handleChangeEmail}
                                    visible={!handleValidateEmail(email)}
                                    value={email}
                                    className={style.input0}
                                    title={
                                        email.length > 0
                                            ? 'Đây phải là một email hoặc số điện thoại'
                                            : 'Trường này không được để trống'
                                    }
                                    placeholder={'Email đăng nhập'}
                                />
                            </div>
                            <div className={style.wrap_input}>
                                <InputValidationCustom
                                    onChange={handleChangePassword}
                                    visible={!handleValidatePass(password)}
                                    value={password}
                                    className={style.input_password}
                                    title={
                                        password.length === 0
                                            ? 'Mật khẩu không được để trống'
                                            : password.length <= 6 && 'Mật khẩu không đủ 6 ký tự'
                                    }
                                    placeholder={'Mật khẩu'}
                                    type={'password'}
                                />
                            </div>
                            <div role={'presentation'} className={style.title_login} onClick={handleSave}>
                                Đăng nhập
                            </div>
                            {/*<div role={'presentation'} className={style.title_login} onClick={signInWithGoogle}>*/}
                            {/*    Đăng nhập Với Google*/}
                            {/*</div>*/}
                            <div
                                style={{
                                    display: 'flex',
                                    flexDirection: 'row',
                                    alignItems: 'center',
                                    justifyItems: 'center',
                                }}
                            >
                                <div style={{ marginRight: 10 }}>Bạn chưa có tài khoản ?</div>
                                <a onClick={handleSingUp}>Đăng ký</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </React.Fragment>
    );
}

export default Login;
