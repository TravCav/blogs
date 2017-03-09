/*
Lookin at your bits
 */
using System; 
namespace BlogStuff {
 
    public class Bitwise {
         [Flags]
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
            00010001    // viewPermissions = 17
            */
          
            var viewPermissions = UserPermissions.View | UserPermissions.ViewPayRates;
            var myPermissions = viewPermissions; 


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

            myPermissions = myPermissions | UserPermissions.Create;
            /*
            00010001    // myPermissions = 17
            00000010    // Create = 2
            00010011    // myPermissions = 19
            */

            if (myPermissions == viewPermissions){
                Console.WriteLine("I only have View and ViewPayRates and nothing else.");
            }

            /*
            00010011    // myPermissions = 19
            00010001    // 17
            00010001    // 17
            */
            var canJustView = UserPermissions.View | UserPermissions.ViewPayRates;
            
            if ((myPermissions & canJustView) == canJustView)
            {
                Console.WriteLine("I have view and ViewPayRates and maybe other things or not.");
            }

            if ((int)myPermissions >= 16){
                Console.WriteLine("I have admin permissions");
            }
            
            
            Console.WriteLine("Press any key to exit."); 
            Console.ReadKey(); 
        }
    }
}