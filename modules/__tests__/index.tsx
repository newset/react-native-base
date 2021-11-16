import React from 'react';
import renderer from 'react-test-renderer';

import App from '../index';

it('renders correctly with defaults', () => {
  const button = renderer
    .create(<App />)
    .toJSON();
  expect(button).toMatchSnapshot();
});