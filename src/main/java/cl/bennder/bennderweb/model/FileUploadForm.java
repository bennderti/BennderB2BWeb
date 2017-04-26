/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.bennder.bennderweb.model;

import java.util.List;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author dyanez
 */
public class FileUploadForm {
    private List<MultipartFile> files;
    public FileUploadForm() {
    }

    public List<MultipartFile> getFiles() {
        return files;
    }

    public void setFiles(List<MultipartFile> files) {
        this.files = files;
    }
    
    
    
    
}
