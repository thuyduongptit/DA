import React from 'react';
import dynamic from 'next/dynamic';
import { Affix, Avatar, Button, Rate } from 'antd';
import PropTypes from 'prop-types';
import { useRouter } from 'next/router';
import { Player } from 'video-react';
import {
    DoubleRightOutlined,
    ShoppingCartOutlined,
    UserOutlined,
    TeamOutlined,
    CheckCircleTwoTone,
} from '@ant-design/icons';

// hooks
import useUserBase from '../../hooks/LogicData/useUserBase';
import useCartBase from '../../hooks/LogicData/useCartBase';

// util
import { url_base_img } from '../../../util/TypeUI';

// style
import style from './style.module.scss';

// component lazy
const CommentDetail = dynamic(import('./Comment/CommentDetail'), { ssr: false});
const WachVideoOpen = dynamic(import('./WachVideoOpen/WachVideoOpen'), { ssr: false});
const NoiDung = dynamic(import('./NoiDungKH/NoiDung'), { ssr: false});

function ContentDetail(props) {
    let videoRef = null;
    const {
        name,
        content,
        number_user,
        trailer_link,
        image_link,
        author_id,
        content_full,
        id,
        sale,
        price,
        list_number,
    } = props;

    // hooks
    const { usersObj, myUser } = useUserBase();
    const { cart, postCart, getListCart } = useCartBase();
    const router = useRouter();

    // const
    const cartFilter = cart.filter((item) => item.product_id === id && item.status === 0);
    let arrListNumber = [];
    let isShowVideo = false;
    try {
        arrListNumber = JSON.parse(list_number);
        isShowVideo = arrListNumber.includes(Number(myUser.id));
    } catch (e) {}

    // handle func
    const addCart = () => {
        if (myUser && myUser.id) {
            const data = {
                product_id: id,
                user_id: Number(myUser.id),
                sale: sale,
            };
            postCart(data);
        } else {
            router.push('/login');
        }
    };

    const handleOk = (data) => {
        router.push(`/thanhtoan?id=${data.id}`);
    };
    const handleDangKyHoc = () => {
        if (myUser && myUser.id) {
            const data = {
                product_id: id,
                user_id: Number(myUser.id),
                sale: sale,
            };
            postCart(data, handleOk);
        } else {
            router.push('/login');
        }
    };

    React.useEffect(() => {
        getListCart({
            product_id: id,
        });
    }, []);

    const getVideoRef = (e) => {
        if (e) {
            videoRef = e.video.video;
        }
    };
    // JSX
    const headComponent = (
        <div className={style.u_course_highlight}>
            <div className={style.container}>
                <div className={style.breadcumb_detail_course}>
                    <a href={'/'} className={style.a}>
                        FBU Learning
                    </a>
                    <DoubleRightOutlined className={style.icon} />
                    <a href={'#'} className={style.a}>
                        {name}
                    </a>
                </div>
                <div className={style.u_detail_block_title}>
                    <h1 className={style.itemReviewed}>
                        <span>{name}</span>
                    </h1>
                    <div className={style.u_detail_desc}>{content}</div>
                    <div className={'flex_row'} style={{ justifyContent: 'flex-start', alignItems: 'center' }}>
                        <div className={style.u_detail_tea}>
                            <Avatar
                                icon={<UserOutlined />}
                                src={`${url_base_img}${
                                    author_id &&
                                    usersObj[author_id.toString()] &&
                                    usersObj[author_id.toString()].avatar &&
                                    usersObj[author_id.toString()].avatar
                                }`}
                            />
                            <p style={{ marginLeft: 5 }}>
                                {usersObj[`${author_id}`] && usersObj[`${author_id}`].name
                                    ? usersObj[`${author_id}`].name
                                    : '[Loading]'}
                            </p>
                        </div>
                        <div className={style.u_detail_tea}>
                            <Rate allowHalf defaultValue={2.5} className={style.icon} />
                            <span style={{ marginLeft: 5 }}>0 ????nh gi??</span>
                        </div>
                        <div className={style.u_detail_tea}>
                            <TeamOutlined />
                            <span style={{ marginLeft: 5 }}>{number_user} h???c vi??n</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );

    if (isShowVideo) return <WachVideoOpen id_product={id} headComponent={headComponent} />;
    return (
        <div style={{ display: 'flex', flexDirection: 'column' }}>
            {headComponent}
            <div className={style.u_detail_course}>
                <div className={style.container_video}>
                    <div className={style.row}>
                        <div className={style.video}>
                            <Player
                                ref={getVideoRef}
                                style={{ width: 750 }}
                                playsInline
                                poster={`${url_base_img}${image_link ? image_link : 'startVideo.jpg'}`}
                                src={url_base_img + trailer_link}
                            />
                        </div>
                    </div>
                    <div className={style.form_menu_noi}>
                        {/*menu*/}
                        <Affix offsetTop={300} onChange={(affixed) => console.log(affixed)} style={{ zIndex: 1 }}>
                            <div className={style.block_buy}>
                                <div className={style.u_sm_left}>
                                    <div className={style.block_price} price>
                                        <span className={style.big_price}>
                                            {/*479,000 <sup>??</sup>*/}
                                            {`${sale ? price - price * (sale / 100) : price}`.replace(
                                                /\B(?=(\d{3})+(?!\d))/g,
                                                ',',
                                            ) + '$'}
                                        </span>
                                        {sale !== 0 && (
                                            <span className={style.small_price}>
                                                {`${price}`.replace(/\B(?=(\d{3})+(?!\d))/g, ',') + '$'}
                                            </span>
                                        )}
                                        <span className={style.discount_price}>-{sale}%</span>
                                    </div>
                                    <div className={style.time_uudai}>
                                        {/*<FieldTimeOutlined style={{ color: 'red' }} /> Th???i gian ??u ????i c??n 1 ng??y*/}
                                    </div>
                                    <div className={style.block_btn}>
                                        <Button className={style.btn_dang_ky} onClick={handleDangKyHoc}>
                                            ????NG K?? H???C
                                        </Button>

                                        {cartFilter.length > 0 ? (
                                            <Button
                                                className={style.btn_them_gio_hang}
                                                icon={<CheckCircleTwoTone twoToneColor='#52c41a' />}
                                                onClick={() => router.push('/cart')}
                                            >
                                                ???? C?? TRONG GI??? H??NG
                                            </Button>
                                        ) : (
                                            <Button
                                                className={style.btn_them_gio_hang}
                                                icon={<ShoppingCartOutlined />}
                                                onClick={addCart}
                                            >
                                                TH??M V??O GI??? H??NG
                                            </Button>
                                        )}

                                        <p>Ho??n ti???n trong 7 ng??y n???u kh??ng h??i l??ng</p>
                                    </div>
                                </div>
                                {/*<div className={style.u_sm_right}>*/}
                                {/*    <div className={style.block_ulti}>*/}
                                {/*        <ul style={{ marginLeft: 0 }}>*/}
                                {/*            <li>*/}
                                {/*                <div style={{ display: 'flex' }}>*/}
                                {/*                    <FieldTimeOutlined />*/}
                                {/*                    <p style={{ marginLeft: 10 }}>Th???i l?????ng : 04 gi??? 43 ph??t</p>*/}
                                {/*                </div>*/}
                                {/*            </li>*/}
                                {/*            <li>*/}
                                {/*                <div style={{ display: 'flex' }}>*/}
                                {/*                    <FieldTimeOutlined />*/}
                                {/*                    <p style={{ marginLeft: 10 }}>Gi??o tr??nh : 30 b??i gi???ng</p>*/}
                                {/*                </div>*/}
                                {/*            </li>*/}
                                {/*            <li>*/}
                                {/*                <div style={{ display: 'flex' }}>*/}
                                {/*                    <FieldTimeOutlined />*/}
                                {/*                    <p style={{ marginLeft: 10 }}> S??? h???u kh??a h???c tr???n ?????i</p>*/}
                                {/*                </div>*/}
                                {/*            </li>*/}
                                {/*            <li>*/}
                                {/*                <div style={{ display: 'flex' }}>*/}
                                {/*                    <FieldTimeOutlined />*/}
                                {/*                    <p style={{ marginLeft: 10 }}>C???p ch???ng nh???n ho??n th??nh</p>*/}
                                {/*                </div>*/}
                                {/*            </li>*/}
                                {/*            <li>*/}
                                {/*                <div style={{ display: 'flex' }}>*/}
                                {/*                    <FieldTimeOutlined />*/}
                                {/*                    <p style={{ marginLeft: 10 }}>*/}
                                {/*                        Gi???m th??m 10% khi thanh to??n online*/}
                                {/*                    </p>*/}
                                {/*                </div>*/}
                                {/*            </li>*/}
                                {/*        </ul>*/}
                                {/*        <div*/}
                                {/*            style={{*/}
                                {/*                display: 'flex',*/}
                                {/*                justifyContent: 'center',*/}
                                {/*            }}*/}
                                {/*        >*/}
                                {/*            <a>B???n c?? m?? gi???m gi???</a>*/}
                                {/*        </div>*/}
                                {/*        <div style={{ display: 'flex' }}>*/}
                                {/*            <Input*/}
                                {/*                placeholder='Nh???p m?? gi???m gi?? ...'*/}
                                {/*                style={{*/}
                                {/*                    width: 200,*/}
                                {/*                    margin: ' 10px 20px',*/}
                                {/*                }}*/}
                                {/*            />*/}
                                {/*            <Button type='primary' style={{ margin: '10px 0px' }}>*/}
                                {/*                ??p d???ng*/}
                                {/*            </Button>*/}
                                {/*        </div>*/}
                                {/*    </div>*/}
                                {/*</div>*/}
                            </div>
                        </Affix>
                    </div>
                </div>
            </div>
            <div className={style.u_des_course} style={{ marginTop: '-70px' }}>
                <div className={style.container_destination}>
                    <h2>Gi???i thi???u kh??a h???c</h2>
                    <hr style={{ height: 0.5, backgroundColor: '#99eae1' }} />
                    <div dangerouslySetInnerHTML={{ __html: content_full }} />
                </div>
            </div>
            <div className={style.u_des_course}>
                <div className={style.container_destination}>
                    <h2>N???i dung kh??a h???c</h2>
                    <hr style={{ height: 0.5, backgroundColor: '#99eae1' }} />
                    <NoiDung product_id={id} />
                </div>
            </div>
            {/*<div className={style.u_des_course}>*/}
            {/*    <div className={style.container_destination}>*/}
            {/*        <h2>Kh??a h???c li??n quan</h2>*/}
            {/*        <hr style={{ height: 0.5, backgroundColor: '#99eae1' }} />*/}
            {/*        <KhoaHoc />*/}
            {/*    </div>*/}
            {/*</div>*/}
            <div className={style.u_des_course}>
                <div className={style.container_destination}>
                    <h2>Th??ng tin gi???ng vi??n</h2>
                    <hr style={{ height: 0.5, backgroundColor: '#99eae1' }} />
                    <div style={{ display: 'flex' }}>
                        <div
                            style={{
                                display: 'flex',
                                flexDirection: 'column',
                                alignItems: 'center',
                                width: 200,
                            }}
                        >
                            <Avatar
                                size={180}
                                icon={<UserOutlined />}
                                src={`${url_base_img}${
                                    author_id &&
                                    usersObj[author_id.toString()] &&
                                    usersObj[author_id.toString()].avatar &&
                                    usersObj[author_id.toString()].avatar
                                }`}
                            />

                            {/*<div className={style.u_detail_students}>*/}
                            {/*    <GiftOutlined className={style.icon} />*/}
                            {/*    <span>*/}
                            {/*        <b>7021</b> h???c vi??n*/}
                            {/*    </span>*/}
                            {/*</div>*/}
                            {/*<div className={style.u_detail_students}>*/}
                            {/*    <VideoCameraAddOutlined className={style.icon} />*/}
                            {/*    <span>*/}
                            {/*        <b>2</b> kh??a h???c*/}
                            {/*    </span>*/}
                            {/*</div>*/}
                        </div>
                        <div style={{ display: 'flex', flexDirection: 'column' }}>
                            <div
                                style={{
                                    fontSize: '18px',
                                    fontWeight: 'bold',
                                    marginLeft: 10,
                                }}
                            >
                                {author_id &&
                                    usersObj[author_id.toString()] &&
                                    usersObj[author_id.toString()].name &&
                                    usersObj[author_id.toString()].name}
                            </div>
                            {myUser && myUser.introduce ? (
                                <div dangerouslySetInnerHTML={{ __html: myUser.introduce ? myUser.introduce : ' ' }} />
                            ) : (
                                '[H??y c???p nh???t]'
                            )}
                            <br></br>
                            <div
                                dangerouslySetInnerHTML={{
                                    __html:
                                        author_id &&
                                        usersObj[author_id.toString()] &&
                                        usersObj[author_id.toString()].info_teacher &&
                                        usersObj[author_id.toString()].info_teacher,
                                }}
                            />
                        </div>
                    </div>
                </div>
            </div>
            <div className={style.u_des_course}>
                <div className={style.container_destination}>
                    <h2>Nh???n x??t c???a h???c vi??n</h2>
                    <hr style={{ height: 0.5, backgroundColor: '#99eae1' }} />
                    <CommentDetail />
                </div>
            </div>
        </div>
    );
}

ContentDetail.propTypes = {};

ContentDetail.defaultProps = {};

export default ContentDetail;
