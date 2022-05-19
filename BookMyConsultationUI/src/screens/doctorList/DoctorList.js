import React, { useState } from 'react';
import { Box, FormControl, Select, MenuItem,Typography } from '@material-ui/core';

const DoctorList = () => {
    const [speciality, setSpeciality] = useState('');
    const handleChange = (event) => {
        setSpeciality(event.target.value);
      };
    return (
        <div style={{display: 'flex', alignItems: 'center', flexDirection: 'column'}}>
            <Typography variant="h6">Select Speciality :</Typography>
            <BasicSelect handleChange={handleChange} speciality={speciality}/>
            Doctor
        </div>
    )
}

export default DoctorList;


export const BasicSelect=({handleChange,speciality})=> {
    
    const specialists = [
        "CARDIOLOGIST",
        "GENERAL_PHYSICIAN",
        "DENTIST",
        "PULMONOLOGIST",
        "ENT",
        "GASTRO"
    ];
    
  
    return (
      <Box sx={{ minWidth: 150 }}>
        <FormControl fullWidth>
          <Select
            labelId="simple-select-label"
            id="simple-select"
            value={speciality}
            label="Age"
            onChange={handleChange}
            >
                {specialists.map(specialist =>
                <MenuItem key={specialist} value={specialist}>{specialist}</MenuItem>
            )}    
          </Select>
        </FormControl>
      </Box>
    );
  }