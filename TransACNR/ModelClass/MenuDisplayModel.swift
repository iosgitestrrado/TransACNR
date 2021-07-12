//
//  MenuDisplayModel.swift
//  TransACNR
//
//  Created by Monish M S on 26/04/18.
//  Copyright © 2018 Monish M S. All rights reserved.
//

import UIKit

class MenuDisplayModel: NSObject {
    var menuLeftPannelImage :String!
    var menu_Image :String!
    var menu_Id :String!
    var menu_Name :String!
    
    
    override init() {
        super.init()
        self.menuLeftPannelImage = ""
        self.menu_Image = ""
        self.menu_Id = ""
        self.menu_Name = ""

    }
    
    init( menuNameinit :String, menuIDinit :String,menuImageinit :String, menuLeftPannelImageinit :String) {
        
        super.init()
        self.menu_Name = menuNameinit
        self.menu_Image = menuImageinit
        self.menu_Id = menuIDinit
        self.menuLeftPannelImage = menuLeftPannelImageinit
    
        
    }
    
    override var description: String
    {
        return "Menu Name : \(menu_Name)" + "Menu ID : \(menu_Id)" + "Image Name : \(menu_Image)" + "MenuLeftPannelImage : \(menuLeftPannelImage)"
    }

    
}
