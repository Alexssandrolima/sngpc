using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Windows.Forms;
using System.Diagnostics;


namespace EnviarSNGPC.Cls
{
    class ClsVerificarProcesso
    {
        public void fecharprocesso()
        {
            // Process.Start(sourcePath + procName);
            Process currentProcess = Process.GetCurrentProcess();
            try
            {
                // Verificando se o sistema já está em execução
                Process Execucao = Process.GetCurrentProcess();
                string NomeProcesso = Execucao.ProcessName;
                // Caso o processo ja esteja em execução, não executar.
                //MessageBox.Show(" Testando se o processo ja esta aberto" + NomeProcesso);
                if (Process.GetProcessesByName(NomeProcesso).Length > 1)
                {
                    MessageBox.Show("Programa " + NomeProcesso + ", em execusão neste momento. ", NomeProcesso + " sendo executado", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    Process.GetCurrentProcess().Kill();
                }
            }
            catch (Exception erroreexecutar)
            {
                MessageBox.Show(erroreexecutar + "\r\n Comando nao executado ", "Error ao Processa Arquivos ");
            }
            return;
        }


    }
}
