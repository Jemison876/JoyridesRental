using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(JoyridesRental.Startup))]
namespace JoyridesRental
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
