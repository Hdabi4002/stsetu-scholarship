# STSetu — MOTA-Aligned SIH Prototype

A lightweight two-surface prototype derived from the MOTA Unified Scholarship project direction.

## 1. Student Mobile App
`student_mobile/` — Flutter

Student-facing mobile flow: Login → Dashboard → Scholarship Schemes → Eligibility → Application Track → Document Wallet/DigiLocker → DBT → JAGO AI.

## 2. Admin / Officer Portal
`admin_portal/` — React + Vite

Officer flow: Overview → Applications → Verification Queue → DBT/Payments → Analytics.

https://stsetu-admin.onrender.com

## 3. Service Layer
`backend/` — FastAPI demo endpoints. Ready to be extended with SQLAlchemy, Pydantic, JWT, multipart uploads and live integrations.

https://stsetu-api.onrender.com

## SIH positioning
Student mobile + officer web portal + FastAPI service layer. Government integrations (DigiLocker, DBT/PFMS, identity verification) are represented as demo/simulation points and are NOT live in this prototype.

## cmd commands
student_mobile>flutter create . --platforms=web

student_mobile>flutter pub get

student_mobile>flutter analyze

    if error found :The name 'MyApp' isn't a class
    
    then open created file "widget_test.dart": student_mobile\test\widget_test.dart
    
    and replace 
    
                        await tester.pumpWidget(const MyApp());
    with
    
            await tester.pumpWidget(const STSetuApp());
            
student_mobile>flutter run -d chrome
