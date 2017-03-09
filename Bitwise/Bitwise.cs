// A Hello World! program in C#.
using System; 
namespace BlogStuff {
 

    pubilc class Bitwise {
         
        enum UserPermissions {
                View = 1,
                Create = 2, 
                Edit = 4, 
                Delete = 8, 
                ViewPayRates = 16, 
                ManageRoles = 32
            }

        public static void Main() {

            

            /*
            00000001    // View = 1
            00010000    // ViewPayRates = 16
            00010001    // myPermissions = 17
            */
            var myPermissions = UserPermissions.View | UserPermissions.ViewPayRates; 


            /*
            00010001    // myPermissions = 17
            00000001    // View = 1
            00000001    // View = 1
            */

            if ((myPermissions & UserPermissions.View) == UserPermissions.View) {
                Console.WriteLine("I can view user info"); 
            }

            if ((myPermissions & UserPermissions.Edit) == UserPermissions.Edit) {
                Console.WriteLine("I can edit user info"); 
            }

            myPermissions = myPermissions | Create;
            /*
            00010001    // myPermissions = 17
            00000010    // Create = 2
            00010011    // myPermissions = 19
            */

            if (myPermissions == 17){
                Console.WriteLine("I only have View and ViewPayRates and nothing else.");
            }

            /*
            00010011    // myPermissions = 19
            00010001    // 17
            00010001    // 17
            */
            int canJustView = UserPermissions.View | UserPermissions.ViewPayRates;
            
            if (myPermissions & canJustView == canJustView)
            {
                Console.WriteLine("I have view and ViewPayRates and maybe other things or not.");
            }

            if (myPermissions >= 16){
                Console.WriteLine("I have admin permisions");
            }
            
            
            Console.WriteLine("Press any key to exit."); 
            Console.ReadKey(); 
        }
    }
}