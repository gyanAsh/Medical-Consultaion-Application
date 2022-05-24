import React from 'react';
import { Card, Typography } from '@material-ui/core'
import { Rating } from '@material-ui/lab';

const DoctorDetails = ({doc}) => {

    return (
        <Card >
            <Typography style={{ height:70, backgroundColor: "purple", color: "white", padding: "11px",display: "flex",alignItems: "center" }} variant="h5">Book an Appointment</Typography>
            <Typography variant="h6" style={{paddingLeft:11,paddingRight:11}}>Dr: {doc.firstName} {doc.lastName}</Typography>
            <Typography variant="h6" style={{paddingLeft:11,paddingRight:11}}>Total Experience: {doc.totalYearsOfExp}</Typography>
            <Typography variant="h6" style={{paddingLeft:11,paddingRight:11}}>Speciality: {doc.speciality}</Typography>
            <Typography variant="h6" style={{paddingLeft:11,paddingRight:11}}>Date of Birth: {doc.dob}</Typography>
            <Typography variant="h6" style={{paddingLeft:11,paddingRight:11}}>City: {doc.address.city}</Typography>
            <Typography variant="h6" style={{paddingLeft:11,paddingRight:11}}>Email: {doc.emailId}</Typography>
            <Typography variant="h6" style={{ paddingLeft: 11, paddingRight: 11 }}>Mobile: {doc.mobile}</Typography>
            <Typography variant="h6" style={{ paddingLeft: 11, paddingRight: 11 }}>Rating: 
                <Rating name="half-rating" defaultValue={doc.rating} precision={0.5} readOnly />
            </Typography>
            </Card>
    )
}

export default DoctorDetails;