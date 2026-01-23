#!/bin/bash

# Define environment variables
export REPO_REF="${REPO_REF:-main}"
export REPO_NAME="${REPO_NAME:-labs}"
export REPO_AUTHOR="${REPO_AUTHOR:-noxtgm}"

# Define environment locations
export REPO_PATH="${HOME}/.local/share/${REPO_NAME}"
export REPO_INSTALL="${REPO_PATH}/install"
export REPO_INSTALL_LOG="${REPO_PATH}/install.log"

# Define colors
export NC='\033[0m'
export RED='\033[0;31m'
export BLUE='\033[0;34m'
export GREEN='\033[0;32m'
export YELLOW='\033[1;33m'
export BOLD_WHITE='\033[1;37m'

# Define ASCII logo
export ascii_logo='
                                                  &&&&&&&&&                                                  
                                        &&&&&&X;;;;: ;;;&&&&&&&&&&&&&                                        
                                   &&&&  ;;;;;;;;;   ;;&&&&&&&&&X;;;;;&&&&                                   
                               &&& :      ;;;;;;;;;    &&&&&&&&;;;;;;;;;;;;&&&                               
                           &&&  ;;;;        :::;;;   ;x&&&&&&;;;;;;;;;;;;;;;;;;&&&                           
                         &&&   ;;;;;;       ;;;;;    ;&&&&&&X;;;;;;;;;;;;;;;;;;;;;&&                         
                      &&&&&&  ;;; :;;;   ;;;;;;;;;;;;;&&&&&&;;;;;;;;;;;;;;;;;;;;;;;;X&&                      
                    &&&&&&&& ;;   ;;;;  ;;;;;;;;;;;;;;&&&&&;;;;;;;;;;;;;;;;;;;;;;;;;;;;&&                    
                  &&&&&&&&&&        ;;;;;;;;;;;;;;;;;;&&&&&;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;&&                  
                &&   &&&&&&&&     ;;;;;;;;;;;;;;;;;;;;&&&&;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;&&                
               &&     &&&&&&&       ;;;;;;;;;;;;;;;;;;&&&&;;;  ;;  ;;;;;;;;;   ;;;;;;;;;;;;;X&               
             &&        &&&&&&&      ;;;;;;;; ;;: ;;;;;&&&;;;        ;;;;;;;:  ;;;;;;;;;;&&&&&&&&             
            &&           &&&&&&;;;;;;;;:    ; ;;;:  ;;&&&;;;    ;:     ;;;;;   ;;;;;;;&&&&&&&&&&&            
          &&              &&&&&&;;;;;       ;    ;;; ;&&& ;;;;;;;;;;;;;;;;;;;;  ;;;$&&&&&&&&&&&&&&           
         &&                 &&&&&;;;;             ;   &&x ;;;;;;;;;;;;;;;;;;;    &&&&&&&&&&&&&&&&&&&         
        &&                    &&&&$  ;;;;;;;;;        && : : ; ;;;:;;;;;;;;;;;;&&&&&&&&&;;;;;;;;;;;&&        
       &&                      x&&&&;;;;;;;;;;        &&        ;  ;;;;;;;;;;&&&&&&&;;;;;;;;;;;;;;;;&        
       &                     ;;;;&&&&;;;;;;;;;;;      &&          ;;;;;;;;;&&&&&&;;;;;;;;;;;;;;;;;;;;&       
      &&                    ;;;;;;;&&&;;;;;;;;;;;;;;  &&;;;;; ;;;;;;;;;;;&&&&&;;;;;;;;;;;;;;;;;;;;;;;X&      
     &&                    ;;;;;;;;;;&&&;;;;;;;;;;;;;;&$;;;;;;;;;;;;;;;X&&&;;;  ;;;;;;;;;;;;;;;;;;;;;;&&     
     &                   ;;;;;;;;;;;;;;&&;;;;;;;;;;;;;&;;;;;;;;;;; ;;;&&&;;;;;;   ;;;;;;;;;;;;;;;;;;;;;&     
    &&                 :;;;;;;;;;;;;;;;;;&&;;;;;;;;;;;&;;;;;;;;;;;; &&;;;;;;;;;;;   ; ;;;;;;;;;;;;;;;;;&&    
    &                 ;;;;;;;;;;;;;;;;;;;;;&;;;;;;;;;;$;;;;;;;;;;;&&  ;;;;;;;;;;;;;;;;;        ;;;;;;;;;&    
   &&&&              ;;;;;;;;;;;;;;;;;;;;;;;;&;;;;;;;;+;;;;;;;;;&$;;; ;;;;;;;;;;;;;;;;;;;        ;;;;;;;&&   
   &&&&&&             ;;;;;;;;;;;;;;;;;;;;;;;;&;;'${RED}'+XXXXXXXX&+'${NC}';;&;;;;;;  :;;;;;;;;;;;;;;;             ;;;;&&   
   &&&&&&&&&          ;;;;;;;;;;;;;;;;;;;;;;;;;'${RED}'&XXXXXXXXXXXXX'${NC}';;;;;;;;;   ;;;;;;;;;;;;;              ;;;;;&   
   &&&&&&&&&&&&&&&    ;;;;;;;;;;;;;;;;;;;;;;;;'${RED}'$XXXXXXXXXXXXXXX'${NC}';;;;;;;;;   ;;;;;;;;;                  ;;;;&   
  &&&&&&&&&&&&&&&&&&&&&&&&x;;;;;;;;;;;;;;;;;;'${RED}'$XXXXXXXXXXXXXXXXX'${NC}';;;;;;;;;; ;;;;;;                      ;;;&   
  &&   &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&'${RED}'$XXXXXXXXXXXXXXXXX'${NC}';;;;;;;;;;;;;                          ;;;&   
  &&                   ;;;;;;;;;;;;;;;;;;;;;;'${RED}'&XXXXXXXXXXXXXXXXX'${NC}'$&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&X;&   
   &                    ;;;;;;;;;;;;;;;;;;;;;;'${RED}'XXXXXXXXXXXXXXXXx'${NC}';;;;;;;;;;;;;;;;;;    &&&&&&&&&&&&&&&&&&&&&   
   &                     ;;;;;;;;;;;;;;;;;;;;;;'${RED}'XXXXXXXXXXXXXXx'${NC}';;;;;;;;;;;;;;;;;;;            &&&&&&&&&&&&&   
   &&                      ;;;;;;;;;     ;;;;;&;;'${RED}'XXXXXXXXXX+'${NC}';;;;;;;;;;;;;;;;;;;;                  &&&&&&&&   
   &&                                       &;;;;;;;;&&x;;;;;&;;;;;;;;;;;;;;;;                       &&&&&   
    &                                     && ;;;;;;;;x;;;;;;;;;&;;;;;;;;;;;;;                          &&    
    &&                                  &&  ;;;;;;;;;$;;;;;;;;;;;&;;;;;;;;;                            &&    
     &                               &&&    ;;;;;;;;;&;;;;;;;;;;; &&;;;;;                              &     
     &&                            &&&        ;;;;;;;&;;;;;;;;;;;;;;&&;;                              &&     
      &&                        &&&&&          ;;;;;;&+;;;;;;;;;;;;;;&&&                             &&      
       &                     &&&&&&            :;;;;;&X;;;;;;;;;;;;;;;;&&&                           &       
       &&                 &&&&&&&               ;;;;;&$;;;;;;;;;;;;;;;;;&&&&                        &        
        &&             &&&&&&&&                 ;;;;x&&;;;;;;;;;;;;;;;;; &&&&&                     &&        
         &&&      &&&&&&&&&&&                   ;;;;&&&;;;;;;;;;;;;;;;;;  &&&&&&                  &&         
          &&&&&&&&&&&&&&&&&                    ;;;;;&&&;;;;;;;;;;;;;;;;;    &&&&&&               &           
            &&&&&&&&&&&&&                     :;;;;;&&&;;;;;;;;;;;;;;;;;   ;;&&&&&&            &&            
             &&&&&&&&&                        ;;;;;&&&&;;;;;;;;;;;;;;      ;;;&&&&&&&         &&             
               &&&&&                            ;;;&&&&;;;;;;;;;;;;        ;;;;&&&&&&&      &&               
                &&                              ;;;&&&&;;;;;;;;;;;;       ;;;;  &&&&&&&    &&                
                  &&                             ;&&&&&;;;;;;;;;;;;       ;;;;  &&&&&&&& &&                  
                    &&                           ;&&&&&;;;;;;;;;;          ;     &&&&&&&&                    
                      &&&                        &&&&&$;;;;;;;;;;                &&&&&&                      
                         &&                     &&&&&&+;;;;;;;;;                &&&&                         
                           &&&&                &&&&&&&;;;;;;;;;               &&&&                           
                               &&&            &&&&&&&&;;;;;;;              &&&                               
                                   &&&&     &&&&&&&&&&                &&&&                                   
                                        &&&&&&&&&&&&&        &&&&&&&&                                        
                                                  &&&&&&&&&                                                  
'

clear

# Remove previous installation if it exists
echo -e "\n$ascii_logo\n"
echo -e "${BOLD_WHITE}Welcome agent, please enter your password to begin the installation process.${NC}"
sudo pacman -Syu --noconfirm --needed git >/dev/null
rm -rf "${REPO_PATH}"

# Lore dump
sleep 2
echo -e "\n${GREEN}[SUCCESS] Agent authentication successful.${NC}"
sleep 2
echo -e "${BLUE}[INFO] Initializing secure communication protocols...${NC}"
sleep 2
echo -e "${BLUE}[INFO] Establishing encrypted connection...${NC}"
sleep 4
clear

# Clone the repository
echo -e "${BLUE}[INFO] Retrieving system components from:${NC} ${BOLD_WHITE}https://github.com/${REPO_AUTHOR}/${REPO_NAME}.git${NC}\n"
git clone "https://github.com/${REPO_AUTHOR}/${REPO_NAME}.git" "${REPO_PATH}" >/dev/null
sleep 2

# Switch to the specified branch
echo -e "\n${BLUE}[INFO] Switching to operational branch:${NC} ${BOLD_WHITE}${REPO_REF}${NC}\n"
cd "${REPO_PATH}" || exit
git fetch origin "${REPO_REF}" && git checkout "${REPO_REF}"
cd - || exit

# Lore dump
echo -e "\n${GREEN}[SUCCESS] Repository secured. Beginning system deployment...${NC}"
sleep 4
clear
echo -e "${YELLOW}[WARNING] This system contains classified information. Unauthorized access is prohibited.${NC}\n"
sleep 3

# Begin the installation process
source "${REPO_PATH}/install.sh"
