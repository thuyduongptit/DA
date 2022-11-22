import React from 'react';
import dynamic from 'next/dynamic';
const HeaderUNICAView = dynamic(import('../components/Header/UNICA/HeaderUNICAView'), {ssr: false});
const AccountHome = dynamic(import('../components/Content/AccountHome/AccountHome'), {ssr: false});
const Footer = dynamic(import('../components/Footer/Footer'), {ssr: false});

function Account() {
    return (
        <div style={{ display: 'flex', flexDirection: 'column' }}>
            <HeaderUNICAView />
            <AccountHome />
            <Footer />
        </div>
    );
}

export default Account;
