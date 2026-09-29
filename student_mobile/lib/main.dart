import 'package:flutter/material.dart';

const navy = Color(0xFF123B5D);
const green = Color(0xFF168A68);
const bg = Color(0xFFF5F8FA);

void main() => runApp(const STSetuApp());

class STSetuApp extends StatelessWidget {
  const STSetuApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'STSetu',
    theme: ThemeData(useMaterial3: true, scaffoldBackgroundColor: bg, colorScheme: ColorScheme.fromSeed(seedColor: navy), fontFamily: 'Arial'),
    home: const LoginPage(),
  );
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override Widget build(BuildContext context) => Scaffold(
    body: SafeArea(child: Center(child: SingleChildScrollView(padding: const EdgeInsets.all(24), child: Column(children: [
      Container(width: 72,height:72,decoration:BoxDecoration(color:navy,borderRadius:BorderRadius.circular(22)),child:const Icon(Icons.shield_outlined,color:Colors.white,size:38)),
      const SizedBox(height:16), const Text('STSetu',style:TextStyle(fontSize:32,fontWeight:FontWeight.w800,color:navy)),
      const Text('Unified Scholarship Platform',style:TextStyle(color:Colors.black54)), const SizedBox(height:30),
      Card(child:Padding(padding:const EdgeInsets.all(22),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
        const Text('Student Demo Login',style:TextStyle(fontSize:20,fontWeight:FontWeight.bold)), const SizedBox(height:6),
        const Text('SIH demonstration mode • Prototype data only',style:TextStyle(color:Colors.black54)), const SizedBox(height:20),
        const TextField(decoration:InputDecoration(labelText:'Mobile / Student ID',prefixIcon:Icon(Icons.person_outline),border:OutlineInputBorder())), const SizedBox(height:14),
        const TextField(decoration:InputDecoration(labelText:'OTP',prefixIcon:Icon(Icons.lock_outline),border:OutlineInputBorder())), const SizedBox(height:20),
        SizedBox(width:double.infinity,child:FilledButton(onPressed:()=>Navigator.pushReplacement(context,MaterialPageRoute(builder:(_)=>const Shell())),child:const Padding(padding:EdgeInsets.all(14),child:Text('Enter Student Dashboard')))),
      ]))), const SizedBox(height:18),
      const Text('React + Vite Admin Portal • FastAPI-compatible architecture',style:TextStyle(fontSize:12,color:Colors.black45),textAlign:TextAlign.center),
    ]))));
}

class Shell extends StatefulWidget { const Shell({super.key}); @override State<Shell> createState()=>_ShellState(); }
class _ShellState extends State<Shell> {
 int index=0; final pages=const [DashboardPage(),SchemesPage(),ApplicationsPage(),DocumentsPage(),PaymentsPage()];
 @override Widget build(BuildContext context)=>Scaffold(appBar:AppBar(title:Row(children:[Container(width:34,height:34,decoration:BoxDecoration(color:navy,borderRadius:BorderRadius.circular(10)),child:const Icon(Icons.shield_outlined,color:Colors.white,size:21)),const SizedBox(width:10),const Text('STSetu',style:TextStyle(fontWeight:FontWeight.w800))]),actions:[IconButton(onPressed:()=>showJago(context),icon:const Icon(Icons.auto_awesome)),IconButton(onPressed:()=>showProfile(context),icon:const Icon(Icons.person_outline))]),body:pages[index],bottomNavigationBar:NavigationBar(selectedIndex:index,onDestinationSelected:(v)=>setState(()=>index=v),destinations:const [NavigationDestination(icon:Icon(Icons.home_outlined),label:'Home'),NavigationDestination(icon:Icon(Icons.school_outlined),label:'Schemes'),NavigationDestination(icon:Icon(Icons.track_changes),label:'Track'),NavigationDestination(icon:Icon(Icons.folder_outlined),label:'Documents'),NavigationDestination(icon:Icon(Icons.account_balance_wallet_outlined),label:'DBT')]));
}

class DashboardPage extends StatelessWidget { const DashboardPage({super.key}); @override Widget build(BuildContext c)=>ListView(padding:const EdgeInsets.all(16),children:[Container(padding:const EdgeInsets.all(20),decoration:BoxDecoration(color:navy,borderRadius:BorderRadius.circular(24)),child:const Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text('STUDENT DASHBOARD',style:TextStyle(color:Colors.white70,fontSize:11,fontWeight:FontWeight.bold)),SizedBox(height:8),Text('Welcome, Student ABC 👋',style:TextStyle(color:Colors.white,fontSize:24,fontWeight:FontWeight.w800)),SizedBox(height:8),Text('Discover schemes, check eligibility, verify documents and track your scholarship journey.',style:TextStyle(color:Colors.white70,height:1.4))]),),const SizedBox(height:16),Row(children:[metric('5','Schemes'),metric('1','Application'),metric('3/3','Docs')]),const SizedBox(height:18),section('Application status'),Card(child:Padding(padding:const EdgeInsets.all(18),child:Column(children:[status('Application Submitted',true),status('Document Verification',true),status('Institute / State Verification',false,current:true),status('Sanction & DBT',false)]))),const SizedBox(height:18),section('Quick services'),GridView.count(crossAxisCount:2,shrinkWrap:true,physics:const NeverScrollableScrollPhysics(),crossAxisSpacing:10,mainAxisSpacing:10,children:[quick(Icons.verified_user_outlined,'Check Eligibility'),quick(Icons.folder_shared_outlined,'Document Wallet'),quick(Icons.notifications_none,'Notifications'),quick(Icons.smart_toy_outlined,'JAGO AI')])]); }
}
Widget metric(String n,String l)=>Expanded(child:Card(child:Padding(padding:const EdgeInsets.symmetric(vertical:16),child:Column(children:[Text(n,style:const TextStyle(fontSize:20,fontWeight:FontWeight.bold,color:navy)),Text(l,style:const TextStyle(fontSize:11,color:Colors.black54))]))));
Widget section(String s)=>Padding(padding:const EdgeInsets.only(bottom:8),child:Text(s,style:const TextStyle(fontSize:17,fontWeight:FontWeight.bold)));
Widget status(String s,bool done,{bool current=false})=>ListTile(leading:CircleAvatar(radius:13,backgroundColor:done?green:current?Colors.orange:Colors.black12,child:Icon(done?Icons.check:current?Icons.schedule:Icons.circle_outlined,color:Colors.white,size:14)),title:Text(s,style:const TextStyle(fontSize:13,fontWeight:FontWeight.w600)),dense:true);
Widget quick(IconData i,String s)=>Card(child:Padding(padding:const EdgeInsets.all(14),child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[Icon(i,color:green,size:25),const SizedBox(height:8),Text(s,textAlign:TextAlign.center,style:const TextStyle(fontWeight:FontWeight.w600,fontSize:12))])));

class SchemesPage extends StatelessWidget { const SchemesPage({super.key}); final schemes=const ['Post-Matric Scholarship','Pre-Matric Scholarship','Top Class Education','National Fellowship for ST','National Overseas Scholarship']; @override Widget build(BuildContext c)=>ListView(padding:const EdgeInsets.all(16),children:[section('Scholarship Schemes'),const Text('Browse the core schemes represented in the MOTA project.',style:TextStyle(color:Colors.black54)),const SizedBox(height:14),...schemes.map((s)=>Card(child:ListTile(leading:CircleAvatar(backgroundColor:navy.withOpacity(.08),child:const Icon(Icons.school_outlined,color:navy)),title:Text(s,style:const TextStyle(fontWeight:FontWeight.bold,fontSize:14)),subtitle:const Text('Eligibility check available • Demo'),trailing:const Icon(Icons.chevron_right),onTap:()=>showEligibility(c,s))))]); }
}
void showEligibility(BuildContext c,String s)=>showModalBottomSheet(context:c,showDragHandle:true,builder:(_)=>Padding(padding:const EdgeInsets.all(22),child:Column(mainAxisSize:MainAxisSize.min,crossAxisAlignment:CrossAxisAlignment.start,children:[Text(s,style:const TextStyle(fontSize:20,fontWeight:FontWeight.bold)),const SizedBox(height:8),const Text('Demo profile match: ST • MCA • annual income ₹2.1L'),const SizedBox(height:15),Container(padding:const EdgeInsets.all(14),decoration:BoxDecoration(color:green.withOpacity(.1),borderRadius:BorderRadius.circular(14)),child:const Row(children:[Icon(Icons.check_circle,color:green),SizedBox(width:8),Text('Eligible for demonstration flow',style:TextStyle(fontWeight:FontWeight.bold))])),const SizedBox(height:16),SizedBox(width:double.infinity,child:FilledButton(onPressed:()=>Navigator.pop(c),child:const Text('Start Application')))])));

class ApplicationsPage extends StatelessWidget { const ApplicationsPage({super.key}); @override Widget build(BuildContext c)=>ListView(padding:const EdgeInsets.all(16),children:[section('Applications Track'),Card(child:Padding(padding:const EdgeInsets.all(18),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[const Text('ST-2026-10482',style:TextStyle(fontWeight:FontWeight.bold,fontSize:18)),const Text('Post-Matric Scholarship',style:TextStyle(color:Colors.black54)),const SizedBox(height:15),const Chip(label:Text('Under Verification')),const Divider(),status('Application Submitted',true),status('Document Verification',true),status('Institute / State Verification',false,current:true),status('Sanction & DBT',false)])))]); }
class DocumentsPage extends StatelessWidget { const DocumentsPage({super.key}); @override Widget build(BuildContext c)=>ListView(padding:const EdgeInsets.all(16),children:[section('Document Wallet'),const Text('Verified documents and DigiLocker demo integration.',style:TextStyle(color:Colors.black54)),const SizedBox(height:12),...['ST Certificate','Income Certificate','Marksheet'].map((d)=>Card(child:ListTile(leading:const Icon(Icons.description_outlined,color:navy),title:Text(d),subtitle:const Text('Verified • Demo document'),trailing:const Icon(Icons.verified,color:green)))),Card(child:ListTile(leading:const Icon(Icons.cloud_outlined,color:green),title:const Text('Connect DigiLocker',style:TextStyle(fontWeight:FontWeight.bold)),subtitle:const Text('Mock gateway for SIH demonstration'),onTap:()=>showDialog(context:c,builder:(_)=>AlertDialog(title:const Text('DigiLocker'),content:const Text('Demo verification completed. No live government service is connected.'),actions:[TextButton(onPressed:()=>Navigator.pop(c),child:const Text('Done'))]))))]); }
class PaymentsPage extends StatelessWidget { const PaymentsPage({super.key}); @override Widget build(BuildContext c)=>ListView(padding:const EdgeInsets.all(16),children:[section('Payment Tracker • DBT'),Card(child:Padding(padding:const EdgeInsets.all(20),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[const Text('Post-Matric Scholarship',style:TextStyle(color:Colors.black54)),const SizedBox(height:4),const Text('₹48,000',style:TextStyle(fontSize:30,fontWeight:FontWeight.w800,color:navy)),const Text('Demo annual support'),const SizedBox(height:12),const Chip(avatar:Icon(Icons.schedule,size:15),label:Text('DBT Processing')),const Divider(height:28),const Text('Destination account  XXXX XXXX 4821'),const SizedBox(height:8),status('Sanction generated',true),status('PFMS / DBT validation',true),status('Payment processing',false,current:true),status('Credit to student',false)])))]); }
void showJago(BuildContext c)=>showDialog(context:c,builder:(_)=>AlertDialog(title:const Text('JAGO AI'),content:const Text('Namaste! I can guide you on scholarship schemes, eligibility, required documents, application stages and DBT status.\n\nDemo answer: Based on the profile, Post-Matric Scholarship is available for an eligibility check.'),actions:[TextButton(onPressed:()=>Navigator.pop(c),child:const Text('Close'))]));
void showProfile(BuildContext c) => showModalBottomSheet(
  context: c,
  showDragHandle: true,
  builder: (_) => const Padding(
    padding: EdgeInsets.all(24),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Applicant Profile',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 14),
        Text('Student ABC'),
        Text('ST Student • MCA'),
        Text('Student ID: STSETU-2026-10482'),
        Text('Institution: KIPM College of Management'),
        Text('State: Uttar Pradesh'),
        SizedBox(height: 10),
        Chip(
          avatar: Icon(Icons.check_circle, size: 15),
          label: Text('Profile verified'),
        ),
      ],
    ),
  ),
);
