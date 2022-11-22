import React from 'react';
import PropTypes from 'prop-types';
import dynamic from 'next/dynamic';

// component
const CategoryView = dynamic(import('../Category/CategoryView'), { ssr: false });
const ManagementUserView = dynamic(import('../ManagementUser/ManagementUserView'), { ssr: false });
const ProductView = dynamic(import('../Product/ProductView'), { ssr: false });
const TransactionView = dynamic(import('../Transaction/TransactionView'), { ssr: false });

// util
import { TYPE_MENU } from 'util/TypeMenu';

function ContentController({ activeMenu, refModalProduct }) {
    let Component;
    switch (activeMenu) {
        case TYPE_MENU.CATEGORY:
            Component = <CategoryView />;
            break;
        case TYPE_MENU.USER:
            Component = <ManagementUserView />;
            break;
        case TYPE_MENU.PRODUCT:
            Component = <ProductView refCallback={refModalProduct} isMenu={activeMenu === TYPE_MENU.PRODUCT} />;
            break;
        case TYPE_MENU.TRANSACTION:
            Component = <TransactionView />;
            break;
        default:
            Component = <React.Fragment />;
            break;
    }
    return Component;
}

ContentController.propTypes = {
    activeMenu: PropTypes.string.isRequired,
};

ContentController.defaultProps = {};

export default ContentController;
