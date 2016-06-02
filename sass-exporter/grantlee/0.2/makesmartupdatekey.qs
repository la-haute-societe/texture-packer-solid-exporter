var MakeSmartUpdateKey = function (pSmartUpdateKey)
{
    return pSmartUpdateKey.rawString().match(/\d+/g).join('');
}
MakeSmartUpdateKey.filterName = "makesmartupdatekey";
MakeSmartUpdateKey.isSafe = false;
Library.addFilter("MakeSmartUpdateKey");