import React from 'react';
import dynamic from 'next/dynamic';
import MetaView from '../../components/MetaView';
import baseAPI from 'redux/api/baseAPI';
import { url_api } from '../../util/TypeUI';
import useUserBase from '../../components/hooks/LogicData/useUserBase';

// const component
const HeaderUNICAView = dynamic(import('../../components/Header/UNICA/HeaderUNICAView'), { ssr: false });
const ContentDetail = dynamic(import('../../components/Content/DetailProduct/ContentDetailProduct'), { ssr: false });
const Footer = dynamic(import('../../components/Footer/Footer'), { ssr: false });

/* Note by MongLV: Server side render */
export async function getServerSideProps(context) {
	const { params } = context;
	// cache miss, need to fetch
	const { data } = await baseAPI.getAll(url_api.PRODUCT, {
		id: params.id,
	});
	return { props: { ...data[0] } };
}

function DetailProduct(props) {
	const { name, author_id } = props;
	const { getListUser } = useUserBase();
	React.useEffect(() => {
		getListUser({ id: author_id });
	}, []);
	return (
		<div style={{ display: 'flex', flexDirection: 'column' }}>
			<MetaView title={`${name} - FBU Learning`} />
			<HeaderUNICAView />
			<ContentDetail {...props} />
			<Footer />
		</div>
	);
}

DetailProduct.propTypes = {};

DetailProduct.defaultProps = {};

export default DetailProduct;
