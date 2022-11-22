/

import queryString from 'query-string';
import { withRouter } from 'next/router';

const withPageRouter = (Component) => {
    return withRouter(({ router, ...props }) => {
        router.query = queryString.parse(router.asPath.split(/\?/)[1]);

        return <Component {...props} router={router} />;
    });
};
export default withPageRouter;
