﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.1
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EnviarSNGPC.Sngpc {
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="Sngpc.sngpcSoap")]
    public interface sngpcSoap {
        
        // CODEGEN: Generating message contract since element name Email from namespace http://tempuri.org/ is not marked nillable
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ValidarUsuario", ReplyAction="*")]
        EnviarSNGPC.Sngpc.ValidarUsuarioResponse ValidarUsuario(EnviarSNGPC.Sngpc.ValidarUsuarioRequest request);
        
        // CODEGEN: Generating message contract since element name Email from namespace http://tempuri.org/ is not marked nillable
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/EnviaArquivoSNGPC", ReplyAction="*")]
        EnviarSNGPC.Sngpc.EnviaArquivoSNGPCResponse EnviaArquivoSNGPC(EnviarSNGPC.Sngpc.EnviaArquivoSNGPCRequest request);
        
        // CODEGEN: Generating message contract since element name Email from namespace http://tempuri.org/ is not marked nillable
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ConsultaDadosArquivoSNGPC", ReplyAction="*")]
        EnviarSNGPC.Sngpc.ConsultaDadosArquivoSNGPCResponse ConsultaDadosArquivoSNGPC(EnviarSNGPC.Sngpc.ConsultaDadosArquivoSNGPCRequest request);
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class ValidarUsuarioRequest {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="ValidarUsuario", Namespace="http://tempuri.org/", Order=0)]
        public EnviarSNGPC.Sngpc.ValidarUsuarioRequestBody Body;
        
        public ValidarUsuarioRequest() {
        }
        
        public ValidarUsuarioRequest(EnviarSNGPC.Sngpc.ValidarUsuarioRequestBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute(Namespace="http://tempuri.org/")]
    public partial class ValidarUsuarioRequestBody {
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=0)]
        public string Email;
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=1)]
        public string Senha;
        
        public ValidarUsuarioRequestBody() {
        }
        
        public ValidarUsuarioRequestBody(string Email, string Senha) {
            this.Email = Email;
            this.Senha = Senha;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class ValidarUsuarioResponse {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="ValidarUsuarioResponse", Namespace="http://tempuri.org/", Order=0)]
        public EnviarSNGPC.Sngpc.ValidarUsuarioResponseBody Body;
        
        public ValidarUsuarioResponse() {
        }
        
        public ValidarUsuarioResponse(EnviarSNGPC.Sngpc.ValidarUsuarioResponseBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute(Namespace="http://tempuri.org/")]
    public partial class ValidarUsuarioResponseBody {
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=0)]
        public string ValidarUsuarioResult;
        
        public ValidarUsuarioResponseBody() {
        }
        
        public ValidarUsuarioResponseBody(string ValidarUsuarioResult) {
            this.ValidarUsuarioResult = ValidarUsuarioResult;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class EnviaArquivoSNGPCRequest {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="EnviaArquivoSNGPC", Namespace="http://tempuri.org/", Order=0)]
        public EnviarSNGPC.Sngpc.EnviaArquivoSNGPCRequestBody Body;
        
        public EnviaArquivoSNGPCRequest() {
        }
        
        public EnviaArquivoSNGPCRequest(EnviarSNGPC.Sngpc.EnviaArquivoSNGPCRequestBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute(Namespace="http://tempuri.org/")]
    public partial class EnviaArquivoSNGPCRequestBody {
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=0)]
        public string Email;
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=1)]
        public string Senha;
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=2)]
        public byte[] Arq;
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=3)]
        public string HashIdentificacao;
        
        public EnviaArquivoSNGPCRequestBody() {
        }
        
        public EnviaArquivoSNGPCRequestBody(string Email, string Senha, byte[] Arq, string HashIdentificacao) {
            this.Email = Email;
            this.Senha = Senha;
            this.Arq = Arq;
            this.HashIdentificacao = HashIdentificacao;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class EnviaArquivoSNGPCResponse {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="EnviaArquivoSNGPCResponse", Namespace="http://tempuri.org/", Order=0)]
        public EnviarSNGPC.Sngpc.EnviaArquivoSNGPCResponseBody Body;
        
        public EnviaArquivoSNGPCResponse() {
        }
        
        public EnviaArquivoSNGPCResponse(EnviarSNGPC.Sngpc.EnviaArquivoSNGPCResponseBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute(Namespace="http://tempuri.org/")]
    public partial class EnviaArquivoSNGPCResponseBody {
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=0)]
        public string EnviaArquivoSNGPCResult;
        
        public EnviaArquivoSNGPCResponseBody() {
        }
        
        public EnviaArquivoSNGPCResponseBody(string EnviaArquivoSNGPCResult) {
            this.EnviaArquivoSNGPCResult = EnviaArquivoSNGPCResult;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class ConsultaDadosArquivoSNGPCRequest {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="ConsultaDadosArquivoSNGPC", Namespace="http://tempuri.org/", Order=0)]
        public EnviarSNGPC.Sngpc.ConsultaDadosArquivoSNGPCRequestBody Body;
        
        public ConsultaDadosArquivoSNGPCRequest() {
        }
        
        public ConsultaDadosArquivoSNGPCRequest(EnviarSNGPC.Sngpc.ConsultaDadosArquivoSNGPCRequestBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute(Namespace="http://tempuri.org/")]
    public partial class ConsultaDadosArquivoSNGPCRequestBody {
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=0)]
        public string Email;
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=1)]
        public string Senha;
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=2)]
        public string CNPJ;
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=3)]
        public string Hash;
        
        public ConsultaDadosArquivoSNGPCRequestBody() {
        }
        
        public ConsultaDadosArquivoSNGPCRequestBody(string Email, string Senha, string CNPJ, string Hash) {
            this.Email = Email;
            this.Senha = Senha;
            this.CNPJ = CNPJ;
            this.Hash = Hash;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class ConsultaDadosArquivoSNGPCResponse {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="ConsultaDadosArquivoSNGPCResponse", Namespace="http://tempuri.org/", Order=0)]
        public EnviarSNGPC.Sngpc.ConsultaDadosArquivoSNGPCResponseBody Body;
        
        public ConsultaDadosArquivoSNGPCResponse() {
        }
        
        public ConsultaDadosArquivoSNGPCResponse(EnviarSNGPC.Sngpc.ConsultaDadosArquivoSNGPCResponseBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute(Namespace="http://tempuri.org/")]
    public partial class ConsultaDadosArquivoSNGPCResponseBody {
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=0)]
        public string ConsultaDadosArquivoSNGPCResult;
        
        public ConsultaDadosArquivoSNGPCResponseBody() {
        }
        
        public ConsultaDadosArquivoSNGPCResponseBody(string ConsultaDadosArquivoSNGPCResult) {
            this.ConsultaDadosArquivoSNGPCResult = ConsultaDadosArquivoSNGPCResult;
        }
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface sngpcSoapChannel : EnviarSNGPC.Sngpc.sngpcSoap, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class sngpcSoapClient : System.ServiceModel.ClientBase<EnviarSNGPC.Sngpc.sngpcSoap>, EnviarSNGPC.Sngpc.sngpcSoap {
        
        public sngpcSoapClient() {
        }
        
        public sngpcSoapClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public sngpcSoapClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public sngpcSoapClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public sngpcSoapClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        EnviarSNGPC.Sngpc.ValidarUsuarioResponse EnviarSNGPC.Sngpc.sngpcSoap.ValidarUsuario(EnviarSNGPC.Sngpc.ValidarUsuarioRequest request) {
            return base.Channel.ValidarUsuario(request);
        }
        
        public string ValidarUsuario(string Email, string Senha) {
            EnviarSNGPC.Sngpc.ValidarUsuarioRequest inValue = new EnviarSNGPC.Sngpc.ValidarUsuarioRequest();
            inValue.Body = new EnviarSNGPC.Sngpc.ValidarUsuarioRequestBody();
            inValue.Body.Email = Email;
            inValue.Body.Senha = Senha;
            EnviarSNGPC.Sngpc.ValidarUsuarioResponse retVal = ((EnviarSNGPC.Sngpc.sngpcSoap)(this)).ValidarUsuario(inValue);
            return retVal.Body.ValidarUsuarioResult;
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        EnviarSNGPC.Sngpc.EnviaArquivoSNGPCResponse EnviarSNGPC.Sngpc.sngpcSoap.EnviaArquivoSNGPC(EnviarSNGPC.Sngpc.EnviaArquivoSNGPCRequest request) {
            return base.Channel.EnviaArquivoSNGPC(request);
        }
        
        public string EnviaArquivoSNGPC(string Email, string Senha, byte[] Arq, string HashIdentificacao) {
            EnviarSNGPC.Sngpc.EnviaArquivoSNGPCRequest inValue = new EnviarSNGPC.Sngpc.EnviaArquivoSNGPCRequest();
            inValue.Body = new EnviarSNGPC.Sngpc.EnviaArquivoSNGPCRequestBody();
            inValue.Body.Email = Email;
            inValue.Body.Senha = Senha;
            inValue.Body.Arq = Arq;
            inValue.Body.HashIdentificacao = HashIdentificacao;
            EnviarSNGPC.Sngpc.EnviaArquivoSNGPCResponse retVal = ((EnviarSNGPC.Sngpc.sngpcSoap)(this)).EnviaArquivoSNGPC(inValue);
            return retVal.Body.EnviaArquivoSNGPCResult;
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        EnviarSNGPC.Sngpc.ConsultaDadosArquivoSNGPCResponse EnviarSNGPC.Sngpc.sngpcSoap.ConsultaDadosArquivoSNGPC(EnviarSNGPC.Sngpc.ConsultaDadosArquivoSNGPCRequest request) {
            return base.Channel.ConsultaDadosArquivoSNGPC(request);
        }
        
        public string ConsultaDadosArquivoSNGPC(string Email, string Senha, string CNPJ, string Hash) {
            EnviarSNGPC.Sngpc.ConsultaDadosArquivoSNGPCRequest inValue = new EnviarSNGPC.Sngpc.ConsultaDadosArquivoSNGPCRequest();
            inValue.Body = new EnviarSNGPC.Sngpc.ConsultaDadosArquivoSNGPCRequestBody();
            inValue.Body.Email = Email;
            inValue.Body.Senha = Senha;
            inValue.Body.CNPJ = CNPJ;
            inValue.Body.Hash = Hash;
            EnviarSNGPC.Sngpc.ConsultaDadosArquivoSNGPCResponse retVal = ((EnviarSNGPC.Sngpc.sngpcSoap)(this)).ConsultaDadosArquivoSNGPC(inValue);
            return retVal.Body.ConsultaDadosArquivoSNGPCResult;
        }
    }
}
