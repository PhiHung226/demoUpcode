import React from 'react';

import PropTypes from 'prop-types';
import { Route } from 'react-router';
import { Redirect } from 'react-router-dom';

const PrivateRoute = ({ component: Component, is_view = true, ...rest }) => {
  const data = {
    data: {
      user: ''
    }
  };
  return (
    <>
      <Route
        { ...rest }
        render={ (props) =>
          data && data.data.user ? is_view ? <Component { ...props } /> :
            <Redirect to={ { pathname: '/error/not-permission', state: { from: props.location } } } /> :
            <Redirect to={ { pathname: '/auth/login', state: { from: props.location } } } /> }
      />
    </>
  );
};

PrivateRoute.propTypes = {
  component: PropTypes.object,
  location: PropTypes.any,
  is_view: PropTypes.bool
};
export default PrivateRoute;