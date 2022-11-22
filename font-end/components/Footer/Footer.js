import React from 'react';
import style from './style.module.scss';
import { url_base_img } from '../../util/TypeUI';
// import PropTypes from 'prop-types';

function Footer() {
    return (
        <div style={{ marginTop: 65 }}>
            <div className={style.footer1}>
                <div className={style.container}>
                    <div className={style.row}>
                        <div className={style.cot_1}>
                        <h4 className={style.title_footer} style={{ fontSize: '23px'}}>Liên hệ với chúng tôi</h4>
                            <ul>
                                <li>
                                    <div>
                                        <span style={{ color: 'white' }}> 0329396422</span>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <span style={{ color: 'white' }}> cskhptit@edu.com.vn </span>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <span style={{ color: 'white' }}> 8:00 - 22:00 </span>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div className={style.cot_2}>
                            <h4 className={style.title_footer}>PTIT Learning</h4>
                            <ul>
                                <li>
                                    <a>Giới thiệu về PTIT Learning</a>
                                </li>
                                <li>
                                    <a>Câu hỏi thường gặp</a>
                                </li>
                                <li>
                                    <a>Điều khoản dịch vụ</a>
                                </li>
                                <li>
                                    <a>Hướng dẫn thanh toán</a>
                                </li>
                                <li>
                                    <a>Kích hoạt khóa học</a>
                                </li>
                                <li>
                                    <a>Góc chia sẻ</a>
                                </li>
                            </ul>
                        </div>
                        <div className={style.cot_2}>
                            <h4 className={style.title_footer}>Hợp tác liên kết</h4>
                            <ul>
                                <li>
                                    <a>Đăng ký giảng viên</a>
                                </li>
                                <li>
                                    <a>Diễn đàn học tập</a>
                                </li>
                                <li>
                                    <a>Thư viện học liệu</a>
                                </li>
                                <li>
                                    <a>Thẻ học online</a>
                                </li>
                                <li>
                                    <a>Blog góc học sinh</a>
                                </li>
                                <li>
                                    <a>Bảo mật thông tin</a>
                                </li>
                                <li>
                                    <a>Chúng tôi đang tuyển dụng</a>
                                </li>
                            </ul>
                        </div>
                        <div className={style.cot_2}>
                            <h4 className={style.title_footer}>HỆ THỐNG KHÓA HỌC TRỰC TUYẾN PTIT</h4>
                            <ul>
                                <iframe
                                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3725.292513152173!2d105.78524921478387!3d20.980908494786373!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135accdd8a1ad71%3A0xa2f9b16036648187!2zSOG7jWMgdmnhu4duIEPDtG5nIG5naOG7hyBCxrB1IGNow61uaCB2aeG7hW4gdGjDtG5n!5e0!3m2!1sen!2sus!4v1668076724862!5m2!1sen!2sus" 
                                    width={400}
                                    height={225}
                                    allowFullScreen=''
                                    loading='lazy'
                                />
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}

Footer.propTypes = {};

Footer.defaultProps = {};

export default Footer;
