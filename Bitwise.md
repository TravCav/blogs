

clinic1 = 1
clinic2 = 2
clinic3 = 4
clinic4 = 8
clinic5 = 16


i can see: clinic1 | clinic2 | clinic4 = 1 | 2 | 8 = 13
user has: clinic 3 | clinic 4 = 4 | 8 = 12

01011
01100



public bool HasPermissions(Permission userPermissions, Permission permissionsToCheckFor)
{
    return permissionsToCheckFor == Permission.None ? 
        false : 
        (userPermissions & permissionsToCheckFor) == permissionsToCheckFor;
}


clinics.HasFlag(Clinics.clinic1)