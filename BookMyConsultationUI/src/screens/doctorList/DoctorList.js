import React, { useState,useEffect } from 'react';
import { Box, Paper, FormControl, Select, MenuItem, Typography } from '@material-ui/core';
import {Rating} from '@material-ui/lab'

const DoctorList = () => {
    const [speciality, setSpeciality] = useState('');
    const [specialists, setSpecialists] = useState([]);
    const [doctorsList, setDoctorsList] = useState([]);
        
    useEffect(() => {
        // getDoctors();
        // getSpecialties();
    }, [])
    

    const handleChange = (event) => {
        setSpeciality(event.target.value);
    };
    
    const getDoctors = () => {
        fetch('/doctors').then(res=> res.json()).then(data=>setDoctorsList(data)).catch(err=>console.error(err));
    }
    const getSpecialties = () => {
        fetch('/doctors/speciality').then(res => res.json()).then(data => setSpecialists(data)).catch(err => console.log(err));
    }
    
    return (
        <div style={{display: 'flex', alignItems: 'center', flexDirection: 'column'}}>
            <Typography variant="h6">Select Speciality :</Typography>
            <BasicSelect handleChange={handleChange} speciality={speciality} specialists={specialists}/>
            {speciality}
            <Box
                sx={{
                    display: 'flex',
                    flexDirection: 'column',
                    gap: 12,
                    m:3,
                    '& > :not(style)': {
                    m: 3,
                    width: 528,
                    height: 128,
                    },
                }}
            >
                {doctorsList.filter(doctorObj => doctorObj.speciality.includes(speciality)).map(doctor => (
                    <Paper key={doctor.id} elevation={5} style={{padding:20}} >
                        <Typography variant="h6" style={{paddingBottom:10}}>
                            Doctor Name : {doctor.firstName} {doctor.lastName}
                        </Typography>
                        <Typography>
                            Speciality : {doctor.speciality}
                        </Typography>
                        <Typography>
                            Rating :
                        <Rating name="half-rating" defaultValue={doctor.rating} precision={0.5} readOnly />
                        </Typography>
                    </Paper>
                )) }
            </Box>
        </div>
    )
}

export default DoctorList;


export const BasicSelect=({handleChange,speciality,specialists})=> {
    
  
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