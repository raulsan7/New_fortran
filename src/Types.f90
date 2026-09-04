MODULE TYPEs

USE Kinds

IMPLICIT NONE

PUBLIC



! ========================================
! WIND TURBINE
! ========================================
TYPE :: WindTurbine_t

    ! --- Input parameters --- !
    CHARACTER(len=100) :: rootname              ! [-] Name without extensions of the OpenFAST output files
    CHARACTER(len=200) :: OP_output_dir         ! [-] Directory with OpenFast output files
    LOGICAL            :: Binary                ! [-] Wheter OpenFast files are binary (.outb) or not (.out)
    REAL(WP)           :: WindSpeed             ! [m/s] Wind Speed in norm    
    REAL(WP)           :: WindDir               ! [deg] Wind direction 0 deg points to +x axis (anticlockwise from +x)
    REAL(WP)           :: Depth                 ! [m] Water depth
    INTEGER(I32)       :: Nmembers              ! [-] Number of structural members in the OpenFAST model
    INTEGER(I32)       :: Nnodes                ! [-] Number of structural nodes in the OpenFAST model
    REAL(WP)           :: AxisPos(2)            ! [m] Position of the turbine axis in xy plane
    REAL(WP)           :: BariPos(2)            ! [m] Position of the turbine baricenter in xy plane

END TYPE WindTurbine_t


! ========================================
! ENVIRONMENT
! ========================================
TYPE :: Environment_t

    ! --- Input parameters --- !
    REAL(WP)           :: depth_base            ! [m] Site depth
    REAL(WP)           :: speed_sound_base      ! [m/s] Base speed of sound in fluid
    REAL(WP)           :: density_base          ! [kg/m3] Base fluid density
    REAL(WP)           :: reference_pressure    ! [Pa] Fluid reference pressure
    REAL(WP)           :: attenuation_surface   ! [-] Surface attenuation coefficient
    REAL(WP)           :: attenuation_bottom    ! [-] Seabed  attenuation coefficient

END TYPE Environment_t


! ========================================
! ACOUSTIC SOLVER
! ========================================
TYPE :: Solver_t

    ! --- Input parameters --- !
    LOGICAL            :: debug                 ! [-] More info for debugin
    LOGICAL            :: in_cluster            ! [-] Wheter we are working on a cluster
    CHARACTER(len=200) :: save_path             ! [-] Where to save results
    CHARACTER(len=50)  :: method                ! [-] Acoustic method to use

END TYPE Solver_t


! ========================================
! CONFIGURATION
! ========================================
TYPE :: Config_t

    TYPE(WindTurbine_t) :: turbine
    TYPE(Environment_t) :: env
    TYPE(Solver_t)      :: solver

END TYPE






END MODULE TYPEs