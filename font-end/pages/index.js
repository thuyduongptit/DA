import React from 'react';
import PropTypes from 'prop-types';
import dynamic from 'next/dynamic';

// Component
import MetaView from '../components/MetaView';

// const component
const HeaderController = dynamic(import('../components/Header/HeaderController'), { ssr: false, loading: () => <p>...</p> });
const ContentController = dynamic(import('../components/Content/ContentController'), {
	ssr: false,
    loading: () => <p>...</p>,
});
const Footer = dynamic(import('../components/Footer/Footer'), { ssr: false, loading: () => <p>...</p> });

// icon
function Index(props) {
    const { dataMeta } = props;
    return (
        <React.Fragment>
            <MetaView {...dataMeta} />
            <HeaderController />
            <ContentController />
            <Footer />
        </React.Fragment>
    );
}

Index.propTypes = {
    dataMeta: PropTypes.object,
};

Index.defaultProps = {
    // Note 3: cần có 1 trường dữ liệu có config từ server
    dataMeta: {
        image: 'https://static.unica.vn/media/images/unica-hoctuchuyengia.jpg',
        title: ' PTIT Learning - Học online cùng chuyên gia',
        name: 'Mongker',
        description:
            ' PTIT Learning - Hệ thống khóa học trực tuyến dành cho người đi làm với hơn 500.000 học viên đang theo học và 2.000 khóa học từ chuyên gia hàng đầu mọi lĩnh vực',
        icon: 'https://static.unica.vn/icon/favicon.ico',
        url: 'https://unica.vercel.app/',
    },
};
export default Index;
