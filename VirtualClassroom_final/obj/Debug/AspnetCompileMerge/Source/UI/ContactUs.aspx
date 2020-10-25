<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Home.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="VirtualClassroom_final.UI.ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <div style="width: 80%;margin-top:40px;margin-bottom:50px;margin-left:10%">
        <fieldset class="fieldsetmain">
            <legend style="font-size: 20px;">Our Location
            </legend>
            <div class="pull-left offset1">       
                <iframe src="https://www.google.com/maps/embed?q=%2B33%C2%B0+56'+36.83%4,+74%C2%B0+47'+46.04%64&ie=UTF-8" width="400" height="300" frameborder="0" style="border: 0"></iframe>
                <%--<img src="Images/map.png" alt="map" />--%>
            </div>
                <div style="margin-left:60%">
                    <fieldset style="margin: 0px; height: 279px">
                        <legend>Query
                        </legend>
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="Rf33" runat="server" ErrorMessage="Required" ControlToValidate="txtname" ForeColor="#990000" />
                                </td>

                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblEmail" runat="server" Text="Email ID"></asp:Label></td>
                                <td>
                                    <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="Rf2" runat="server" ForeColor="#990000" ErrorMessage="Required" ControlToValidate="txtEmail" />
                                </td>

                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblContact" runat="server" Text="Contact Number"></asp:Label></td>
                                <td>
                                    <asp:TextBox ID="txtContact" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator  runat="server" ForeColor="#990000" ErrorMessage="Required" ControlToValidate="txtContact" />
                                </td>

                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblMessage" runat="server" Text="Message"></asp:Label></td>
                                <td>
                                    <asp:TextBox ID="txtMessage" runat="server" Height="95px" TextMode="MultiLine" Width="240px"></asp:TextBox></td>

                            </tr>
                            <tr align="center">
                                <td></td>
                                <td>
                                    <span style="float: left; text-align: left">
                                        <asp:Button ID="btnSendMsg" runat="server" Text="Send Message" CssClass="button" OnClick="btnSendMsg_Click" /><br />
                                        &nbsp;
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtemail" ValidationExpression="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$" runat="server" ForeColor="#990000" ErrorMessage="Email not valid" Display="Dynamic"></asp:RegularExpressionValidator><br />
                                        <asp:RequiredFieldValidator ID="Rf1" runat="server" ForeColor="#990000" ErrorMessage="Message Required" ControlToValidate="txtMessage" /><br />
                                        <asp:Label ID="lblresp" runat="server" CssClass="lblresponse" />
                                    </span>
                                </td>


                            </tr>
                        </table>
                    </fieldset>
                </div>
           
            <br /><br />
            <div>
               <div style="width: 350px; float: left;margin-bottom:70px">
                    <fieldset style="height: 100px">
                        <legend>Contact Information
                        </legend>
                        <p>
                            <b style="color:blueviolet;font-family:'Franklin Gothic Medium', 'Arial Narrow', 'Arial', 'sans-serif';">Query Email  : </b><font style="color:navy">sidza.edu@sidza.com</font><br />
                            <b style="color:blueviolet";font-family:'Franklin Gothic Medium', 'Arial Narrow', 'Arial', 'sans-serif'">Owner Email  : </b><font style="color:navy">chemicalbilal@rediffmail.com</font><br />
                            <b style="color:blueviolet";font-family:'Franklin Gothic Medium', 'Arial Narrow', 'Arial', 'sans-serif';">Owner Name  : </b><font style="color:navy">BILAL AHMAD KHAWAJA</font><br />
                        </p>
                    </fieldset>
                </div>
                
            </div> 
        </fieldset>
    </div>
    
</asp:Content>
