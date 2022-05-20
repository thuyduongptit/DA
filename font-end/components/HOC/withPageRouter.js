/**
 * Copyright 2020 present, Lê Văn Mong.
 * All rights reserved.
 *  on 12/05/2021

 * @university: FBU ( đại học tài chính ngân hàng hà nội)
 */

import queryString from 'query-string';
import { withRouter } from 'next/router';

const withPageRouter = (Component) => {
    return withRouter(({ router, ...props }) => {
        router.query = queryString.parse(router.asPath.split(/\?/)[1]);

        return <Component {...props} router={router} />;
    });
};
export default withPageRouter;
