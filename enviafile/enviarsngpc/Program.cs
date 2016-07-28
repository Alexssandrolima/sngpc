using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;

namespace EnviarSNGPC
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Cls.ClsVerificarProcesso testarsistema = new Cls.ClsVerificarProcesso();
            testarsistema.fecharprocesso();

            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new FrmEnviarSNGPC());
        }
    }
}
