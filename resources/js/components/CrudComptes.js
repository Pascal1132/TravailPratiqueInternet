import React from 'react';
import ReactDOM from 'react-dom';


const CONTENEUR_AFFICHER = 0;
const CONTENEUR_MODIFIER = 1;
const CONTENEUR_AJOUTER = 2;

class CrudComptes extends React.Component {



    constructor() {
        super();
        this.state = {
            url_envoi: "",
            utilisateurs: [],
            utilisateurConnecte:null,
            comptes: null,
            typesCompte:[],
            conteneur: 0,
            idCompte: -1,
            compte: null,
            bearerToken:null,
            courriel:'',
            mdp:'',
            reponseMessageUtilisateur: "",
            reponseMessage:"",
        };
        this.handleOnClickModifier = this.handleOnClickModifier.bind(this);
        this.getTableAfficher = this.getTableAfficher.bind(this);
        this.afficherConteneur = this.afficherConteneur.bind(this);
        this.handleOnClickRetour = this.handleOnClickRetour.bind(this);
        this.getFormModifier = this.getFormModifier.bind(this);
        this.getCompte = this.getCompte.bind(this);
        this.handleOnClickAjouter = this.handleOnClickAjouter.bind(this);
        this.getFormAjouter = this.getFormAjouter.bind(this);
        this.getUtilisateurs = this.getUtilisateurs.bind(this);
        this.getComptes = this.getComptes.bind(this);
        this.handleOnClickAjouterModifierForm = this.handleOnClickAjouterModifierForm.bind(this);
        this.handleNomChange = this.handleNomChange.bind(this);
        this.handleRadioChange = this.handleRadioChange.bind(this);
        this.handleUtilisateurChange = this.handleUtilisateurChange.bind(this);
        this.handleOnClickSupprimer = this.handleOnClickSupprimer.bind(this);
        this.getFormConnexion = this.getFormConnexion.bind(this);
        this.handleOnClickConnexion = this.handleOnClickConnexion.bind(this);
        this.handleOnClickDeconnexion = this.handleOnClickDeconnexion.bind(this);
        this.handleOnClickChangerMdp = this.handleOnClickChangerMdp.bind(this);


    }

    handleOnClickConnexion(){
        let dataOptions;
        dataOptions= {
            '_token': CSRF_TOKEN,
            'courriel': this.state.courriel,
            'password': this.state.mdp,
        }

            var self = this;

            axios(APP_URL + '/api/auth/login', {method: 'POST', data:dataOptions})

                .then(response => {


                    this.setState({reponseMessageUtilisateur: "Vous êtes maintenant connecté!"});
                    this.setState({bearerToken: response.data.access_token, utilisateurConnecte: response.data.utilisateur});


                }).catch(function (error) {
                console.log('ERREUR : ' + error.message + ' CODE:'+error.response.status);
                if(error.response && error.response.status == 401){
                    self.setState({reponseMessageUtilisateur: "Les informations d'identification ne correspondent pas!"});
                }
            })



    }

    handleOnClickDeconnexion(){
        this.setState({
            bearerToken:null,
            reponseMessageUtilisateur:'',

        })
    }
    handleOnClickChangerMdp(){
        let dataOptions;
        dataOptions= {
            '_token': CSRF_TOKEN,

            'mot_de_passe': this.state.mdp,
        }

        var self = this;
        if(self.state.utilisateurConnecte){
            axios(APP_URL + '/api/utilisateurs/'+self.state.utilisateurConnecte.id, {method: 'PUT', data:dataOptions, headers:{
                    'Authorization': 'Bearer '+this.state.bearerToken
                }})

                .then(response => {
                    console.debug(response);

                    this.setState({reponseMessageUtilisateur: "Votre mot de passe a été changé!"});
                    this.setState({bearerToken: response.data.access_token});

                }).catch(function (error) {
                console.log('ERREUR : ' + error.message + ' CODE:'+error.response.status);
                if(error.response && error.response.status == 401){
                    self.setState({reponseMessageUtilisateur: "Vous n'êtes pas connecté!"});
                }
            })
        }else{
            self.setState({reponseMessageUtilisateur: "Vous n'êtes pas connecté!"});
        }


    }

    handleOnClickSupprimer(id){
        var self = this;
        if(confirm('Êtes-vous certain de vouloir supprimer cette ligne ?')){
            let dataOptions;
            dataOptions= {
                '_token': CSRF_TOKEN,


            }
                axios(APP_URL + '/api/comptes/'+id, {method: 'DELETE', data:dataOptions, headers:{
                        'Authorization': 'Bearer '+this.state.bearerToken
                    }})

                    .then(response => {
                        this.setState({
                            reponseMessage:'Suppression effectuée'
                        })

                        this.getComptes();
                    }).catch(function (error) {
                    if(error.response && error.response.status == 401){
                        self.setState({reponseMessage: "Vous n'êtes pas connecté!"});
                    }
                    console.log('ERREUR : ' + error.message);
                })
        }

    }
    afficherConteneur(){
        var conteneur;
        switch (this.state.conteneur) {
            case CONTENEUR_AFFICHER:
                conteneur = this.getTableAfficher();
                break;
            case CONTENEUR_MODIFIER:
                conteneur = this.getFormModifier();
                break
            case CONTENEUR_AJOUTER:
                conteneur = this.getFormAjouter();
                break;

        }
        return conteneur;

    }
    getCompte(id){

        fetch(APP_URL + '/api/comptes/'+id, {
            method: 'GET'
        }).then(response => response.json())
            .then(response => {


                this.setState({compte: response.data }) ;

            }).catch(function (error) {
            console.log('ERREUR : ' + error.message);
        }).catch(function (error) {
            console.log('ERREUR : ' + error.message);
        });

    }

    handleRadioChange(e){

        let compte;
        compte = this.state.compte;
        compte.type_compte_id = e.target.value;
        this.setState({compte: compte});
    }
    handleUtilisateurChange(e){
        let compte;
        compte = this.state.compte;
        compte.utilisateur_id = e.target.value;
        this.setState({compte: compte});
    }
    handleNomChange(e){
        let compte;
        compte = this.state.compte;
        compte.nom = e.target.value;
        this.setState({compte: compte});
    }
    getFormModifier(){
        if(this.state.compte !== null){
        console.log('COMPTE:');
        console.debug(this.state.compte);


        return <div>
            <button className='btn btn-sm btn-secondary' onClick={this.handleOnClickRetour}>Retour</button>
            <h1>Modifier le compte</h1>

            {this.state.typesCompte.map((item, i) => {

                return <div className="custom-control custom-radio custom-control-inline" key={item.id}><input type="radio" className="custom-control-input" id={"input-" + item.type} name="type"
                              value={item.id} defaultChecked={this.state.compte.type_compte_id === item.id} onChange={this.handleRadioChange}/>
                <label className="custom-control-label" htmlFor={"input-"+item.type}>{item.type}
                </label></div> ;

            })}
            <div className="form-group">
                <label htmlFor="choixUtilisateur">Utilisateur : </label>
                <select id="choixUtilisateur" defaultValue={this.state.compte.utilisateur.id} className="form-control" onChange={this.handleUtilisateurChange}>
                    {this.state.utilisateurs.map((item, i)=> {


                        return (<option key={item.id} value={item.id}>{item.nom}</option>);

                    })}

                </select>
            </div>
            <input type="hidden" value={this.state.compte.id} name="id" id="idCompte"/>
                <div className="form-group">
                    <label htmlFor="nomCompte">Nom du compte :</label>
                    <input type="text" className="form-control" id="nomCompte" placeholder="Nom du compte"
    name="nom" value={this.state.compte.nom} onChange={this.handleNomChange}/>
                </div>
                <button type="submit" className="btn-send btn btn-primary" onClick={this.handleOnClickAjouterModifierForm.bind(this)}>Modifier</button>
        </div>;}else{
            return <p>Chargement...</p>;
        }

    }
    getTableAfficher(){
        if(this.state.comptes !== null){
        return <table className="table">
            <thead className="thead-dark">
            <tr>
                <th scope="col">Utilisateur</th>
                <th scope="col">Nom du compte</th>
                <th scope="col">Type du compte</th>

                <th scope="col">Montant</th>



                <th scope="col"></th>


            </tr>
            </thead>
            <tbody id="liste-compte-tbody">

            {this.state.comptes.map((item, i) => {

                return <tr key={item.id}>
                    <td>{item.utilisateur.nom}</td>
                    <td>{item.nom}</td>
                    <td>{item.type_compte.type}</td>
                    <td>{item.montant} $</td>
                    <td className="float-right"><button className='btn btn-success btn-sm ' onClick={this.handleOnClickModifier.bind(this, item.id)}>Modifier</button>&nbsp;
                    <button className='ml-1 btn btn-danger btn-sm' onClick={this.handleOnClickSupprimer.bind(this, item.id)}>Supprimer</button></td>
                </tr> ;

            })}
            <tr>
                <td colSpan='5'><button className='btn btn-info ' onClick={this.handleOnClickAjouter}>Ajouter un nouveau compte</button></td>
            </tr>





        </tbody>
        </table>;
        }else{
            return <p>Chargement...</p>;
        }
    }

    componentDidMount() {
        fetch(APP_URL + '/api/types_compte', {
            method: 'GET'
        }).then(response => response.json())
            .then(response => {


                this.setState({typesCompte: response.data});
            }).catch(function (error) {
            console.log('ERREUR : ' + error.message);
        });
        this.getComptes();
        axios(APP_URL+'/api/routeur/'+'transaction.ajouter.admin', {method: 'GET', data:{'_token': CSRF_TOKEN}}).then(response=>{
            this.setState({url_envoi:response.data});

        }).catch(function(error){
            console.log('ERREUR : '+ error.message);
        });
        this.getUtilisateurs();
    }
    getComptes(){
        fetch(APP_URL + '/api/comptes', {
            method: 'GET'
        }).then(response => response.json())
            .then(response => {


                this.setState({comptes: response.data});
            }).catch(function (error) {
            console.log('ERREUR : ' + error.message);
        });
    }

    getUtilisateurs(){
        fetch(APP_URL + '/api/utilisateurs/', {
            method: 'GET'
        }).then(response => response.json())
            .then(response => {


                this.setState({utilisateurs: response.data }) ;

            }).catch(function (error) {
            console.log('ERREUR : ' + error.message);
        }).catch(function (error) {
            console.log('ERREUR : ' + error.message);
        });
    }

    handleOnClickModifier(id){
        console.log('id : '+id);


        this.setState({conteneur:CONTENEUR_MODIFIER, idCompte:id});
        this.getCompte(id);
    }
    handleOnClickRetour(){
        console.log('Retour');
        this.getComptes()
        this.setState({conteneur:CONTENEUR_AFFICHER, reponseMessage:''});
    }

    handleOnClickAjouter() {
        console.log('Ajouter');
        this.setState({conteneur:CONTENEUR_AJOUTER});
        let compte = {type_compte_id:-1, utilisateur_id:-1, nom:-1};
        this.setState({compte: compte});
    }
    render() {
        return (
            <div className="mt-2">
                {this.getFormConnexion()}
                <hr/>
                <p className={"text-danger"}>{this.state.reponseMessage}</p>
                {this.afficherConteneur()}


            </div>
        );
    }


    getFormAjouter() {


        return <div>
            <button className='btn btn-sm btn-secondary' onClick={this.handleOnClickRetour}>Retour</button>
            <h1>Ajouter un compte</h1>

            {this.state.typesCompte.map((item, i) => {

                return <div className="custom-control custom-radio custom-control-inline" key={item.id}><input type="radio" className="custom-control-input" id={"input-" + item.type} name="type"
                                                                                                               value={item.id}  onChange={this.handleRadioChange}/>
                    <label className="custom-control-label" htmlFor={"input-"+item.type}>{item.type}
                    </label></div> ;

            })}


            <div className="form-group">
                <label htmlFor="choixUtilisateur">Utilisateur : </label>
                <select id="choixUtilisateur" className="form-control" onChange={this.handleUtilisateurChange}>
                    <option value="-1" hidden={true}>Faites le choix de l'utilisateur... </option>
                    {this.state.utilisateurs.map((item, i)=> {


                        return (<option key={item.id} value={item.id}>{item.nom}</option>);

                    })}

                </select>
            </div>

            <div className="form-group">
                <label htmlFor="nomCompte">Nom du compte :</label>
                <input type="text" className="form-control" id="nomCompte" placeholder="Nom du compte"
                       name="nom" onChange={this.handleNomChange}/>
            </div>
            <button type="submit" className="btn-send btn btn-primary" onClick={this.handleOnClickAjouterModifierForm.bind(this)}>Ajouter</button>
        </div>;
    }

    getFormConnexion(){
        return <div >
            <p className="text-secondary">{(this.state.bearerToken === null) ? 'Vous n\'êtes pas connecté': "Vous êtes connecté"}</p>
                <div className={"form-inline"}>
                <div className="form-group m-2">
                    <label htmlFor="courriel" className="m-1">Courriel</label>
                    <div className="">
                        <input type="text" className="form-control " id="courriel"
                               placeholder="Courriel" onChange={(e)=>{
                            this.setState({courriel:e.target.value});
                        }} />
                    </div>
                </div>
                <div className="form-group m-2">
                    <label htmlFor="mdp" className="m-1">Mot de passe</label>
                    <div className="">
                        <input type="password" className="form-control " id="mdp" placeholder="Mot de passe" onChange={(e)=>{
                            this.setState({mdp:e.target.value});
                        }}/>
                    </div>
                </div>


                </div>
            <button className={"btn-sm btn-success m-1"} onClick={this.handleOnClickConnexion}>Se connecter</button>
            <button className={"btn-sm btn-danger m-1"} onClick={this.handleOnClickDeconnexion}>Se déconnecter</button>
            <button className={"btn-sm btn-warning m-1"} onClick={this.handleOnClickChangerMdp}>Changer le mot de passe</button>

            <p className={"text-danger"}>{this.state.reponseMessageUtilisateur}</p>

        </div>;
    }


    handleOnClickAjouterModifierForm() {

        let dataOptions;
        dataOptions= {
                '_token': CSRF_TOKEN,
                'type_compte_id': this.state.compte.type_compte_id,
                'utilisateur_id': this.state.compte.utilisateur_id,
                'nom': this.state.compte.nom,


            }
            var self = this;

        if(this.state.compte.id>0){
            //Alors on modifie
            axios(APP_URL + '/api/comptes/'+this.state.compte.id, {method: 'PUT', data:dataOptions, headers:{
                    'Authorization': 'Bearer '+this.state.bearerToken
                }})

                .then(response => {

                    alert("Modification sauvegardée");

                }).catch(function (error) {
                    console.log('ERREUR : ' + error.message);
                if(error.response && error.response.status === 401){
                    self.setState({reponseMessage: "Vous n'êtes pas connecté: Refusé!"});
                }
                })
        }else{

            //Alors on ajoute
            axios(APP_URL + '/api/comptes', {method: 'POST', data:dataOptions, headers:{
                    'Authorization': 'Bearer '+this.state.bearerToken
                }})

                .then(response => {

                    alert("Ajout effectué");
                    console.debug(response);

                }).catch(function (error) {
                    console.log('ERREUR : ' + error.message);
                    if(error.response && error.response.status === 401){
                        self.setState({reponseMessage: "Vous n'êtes pas connecté: Refusé!"});
                    }
                })
        }

    }
}

export default CrudComptes;

// DOM element
if (document.getElementById('crud-comptes')) {
    ReactDOM.render(<CrudComptes
                                      />, document.getElementById('crud-comptes'));
}