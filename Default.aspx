<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="Condiciones._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Condiciones de salud</h1>
        <p class="lead">Antes de ingresar a la Clínica, por favor responda las siguientes preguntas, las cuales ayudarán a prestarle una mejor atención.</p>
        <p>
            <a class="btn btn-primary btn-lg">
            <asp:Button ID="Button1" runat="server" Text="Nuevo ingreso &gt;&gt;" />
            </a>
        </p>
    </div>

    <div class="row">
        <div class="col-md-4 col-md-4-a">
                <asp:RadioButtonList ID="rblTipoId" runat="server" RepeatDirection="Horizontal"  >
                    <asp:ListItem Value="1">&nbsp;CC&nbsp;&nbsp;</asp:ListItem>
                    <asp:ListItem Value="2">&nbsp;CE&nbsp;&nbsp;</asp:ListItem>
                    <asp:ListItem Value="3">&nbsp;TI&nbsp;&nbsp;</asp:ListItem>
                    <asp:ListItem Value="4">&nbsp;PA&nbsp;&nbsp;</asp:ListItem>
                    <asp:ListItem Value="0">&nbsp;Otro</asp:ListItem>
                </asp:RadioButtonList>
        </div>
        <div class="col-md-4 col-md-4-a col-md-4-bolder">
            Identificación:&nbsp;&nbsp;<asp:TextBox ID="tbIdentificacion" runat="server" Width="150px"></asp:TextBox>
        </div>
        <div class="col-md-4 col-md-4-a">
            <asp:RadioButtonList ID="rblTipoIngreso" runat="server" RepeatDirection="Horizontal"  >
            <asp:ListItem Value="1">&nbsp;Paciente/Visitante&nbsp;&nbsp;</asp:ListItem>
            <asp:ListItem Value="0">&nbsp;Colaborador Clínica</asp:ListItem>
            </asp:RadioButtonList>
        </div>  
    </div>

    <div class="row row-imagen" id="imgResultado">
        <div class="col-md-4 col-md-4-rojo">
            <asp:Image CssClass="img_imagen" ID="imgClasif" runat="server" />
        </div> 
        <div class="col-md-4 col-md-4-rojo">
            <asp:Label ID="clasificacion" runat="server" Text="Por favor, mostrar esta clasificación al personal de vigilancia y/o recepción para acceder a sus servicios"></asp:Label>   
        </div>
        <div class="col-md-4 col-md-4-rojo">
            <asp:Label ID="fecha" runat="server" Text=""></asp:Label>   
        </div>
    </div>

    <asp:Panel ID="panelMain" runat="server">
    <div class="row" id="RSintomas">
        <div class="col-md-4">
            <h2>¿Ha presentado alguno de los siguientes síntomas?</h2>
            <p>
                - Tos, dificultad respiratoria, dolor de garganta</p>
            <p>
                - Fiebre cuantificada mayor de 38°C</p>
            <p>
                - Secreción nasal (Moco o flema)</p>
            <p>
                - Malestar general, escalofrío o dolor muscular</p>
            <p>
                - Disminución en la percepción de olores y/o sabores</p>
            <p>
                - Diarrea</p>
            <br />
            <article>
                <div class="btn btn-default btn-default-option" >
                <asp:RadioButtonList ID="rblSintomas" runat="server" RepeatDirection="Vertical" EnableTheming="True">
                    <asp:ListItem Value="1">&nbsp; SI</asp:ListItem>
                    <asp:ListItem Value="0">&nbsp; NO</asp:ListItem>
                </asp:RadioButtonList>
                </div>
            </article>
            <br />
        </div>
        <div class="col-md-4" id ="RContacto">
            <h2>Durante los últimos 15 días </h2>
            <p>
                - ¿Ha tenido contacto estrecho sin protección (Menos de 1 metro durante al menos 15 minutos) con una persona positiva para Covid-19?</p>
            <p>
                - ¿Ha tenido contacto estrecho sin protección (Menos de 1 metro durante al menos 15 minutos) con una persona sospechosa de ser positiva para Covid-19 o que presenta síntomas?</p>
            <br />
            <article>
                <div class="btn btn-default btn-default-option" >
                <asp:RadioButtonList ID="rblQuinceDias" runat="server" RepeatDirection="Vertical">
                    <asp:ListItem Value="1">&nbsp; SI</asp:ListItem>
                    <asp:ListItem Value="0">&nbsp; NO</asp:ListItem>
                </asp:RadioButtonList>
                </div>
            </article>
            <br />

        </div>
        <div class="col-md-4" id ="RPruebas">
            <h2>Pruebas diagnósticas</h2>
            <p>
                - ¿En los últimos 15 días le han realizado prueba de Covid-19 con muestra en nariz o garganta (RT- PCR o antígeno) que ha salido positiva?</p>
            <p>
                &nbsp;- ¿En los últimos 15 días ha estado o está en aislamiento preventivo porque ha sido diagnosticado de Covid-19?</p>
            <br />
            <article>
                <div class="btn btn-default btn-default-option" >
                <asp:RadioButtonList ID="rblPruebasDx" runat="server" RepeatDirection="Vertical">
                    <asp:ListItem Value="1">&nbsp; SI</asp:ListItem>
                    <asp:ListItem Value="0">&nbsp; NO</asp:ListItem>
                </asp:RadioButtonList>
                </div>
            </article>
            <br />
        </div>
    </div>
    </asp:Panel>
    <br/>

    <div class="row">
        <br/>
        <br/>
        <br/>
        <p>
            <asp:Label CssClass="tb_error" ID="lblAlerta" runat="server" Text="* Error: Por favor responder todo el cuestionario..."></asp:Label>
        </p>
    </div>
    <br/>

    <div class="row">
        <p>
            <br />
            <a class="btn btn-primary btn-lg bt_alaDerecha">
            <asp:Button CssClass ="bt_alaDerecha" ID="BtFinalizar" runat="server" Text="Validar ingreso &gt;&gt;" />
            </a>
        </p>
    </div>

</asp:Content>
