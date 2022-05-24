import React,{useState} from 'react';
import Header from '../../common/header/Header';
import DoctorList from '../../screens/doctorList/DoctorList';
import Appointment from '../../screens/appointment/Appointment';
import PropTypes from 'prop-types'
import { Tabs, Tab, Box, Typography } from '@material-ui/core';


const Home = () => {
  const [loggedInToken, setLoggedInToken] = useState(
    sessionStorage.getItem('access-token')
  )
    return (
        <div>
        <Header loggedInToken={loggedInToken} setLoggedInToken={setLoggedInToken} />
          <BasicTabs loggedInToken={loggedInToken}  />
        </div>
    )
}

export default Home;


const TabPanel=props=> {
    const { children, value, index, ...other } = props;
  
    return (
      <div
        role="tabpanel"
        hidden={value !== index}
        id={`simple-tabpanel-${index}`}
        aria-labelledby={`simple-tab-${index}`}
        {...other}
      >
        {value === index && (
          <Box sx={{ p: 3  }}>
            <Typography>{children}</Typography>
          </Box>
        )}
      </div>
    );
  }
  
  TabPanel.propTypes = {
    children: PropTypes.node,
    index: PropTypes.number.isRequired,
    value: PropTypes.number.isRequired,
  };
  
  function a11yProps(index) {
    return {
      id: `simple-tab-${index}`,
      'aria-controls': `simple-tabpanel-${index}`,
    };
  }
  
  export function BasicTabs({loggedInToken}) {
    const [value, setValue] = useState(0);
  
    const handleChange = (event, newValue) => {
      setValue(newValue);
    };
  
    return (
      <Box sx={{ width: '100%' }}  >
        <Box sx={{ borderBottom: 1, borderColor: 'divider' }} >
          <Tabs  value={value} onChange={handleChange} aria-label="basic tabs example">
            <Tab style={{minWidth:"50%"}} label="DOCTORS" {...a11yProps(0)} />
            <Tab style={{minWidth:"50%"}} label="APPOINTMENT" {...a11yProps(1)} />
          </Tabs>
        </Box>
        <TabPanel value={value} index={0}>
          <DoctorList loggedInToken={loggedInToken} />
        </TabPanel>
        <TabPanel value={value} index={1}>
          <Appointment loggedInToken={loggedInToken}/>
        </TabPanel>
      </Box>
    );
  }