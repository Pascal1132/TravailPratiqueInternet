import React from 'react';
import ReactDOM from 'react-dom';

class ListesLieesReact extends React.Component {


    constructor() {
        super();

        this.state = {
            title: "Titre",
            url_envoi: "",
            utilisateurs: [],
            comptes: []
        };
        this.recupererComptes = this.recupererComptes.bind(this);
    }

    componentDidMount() {
        fetch(APP_URL + '/api/utilisateurs', {
            method: 'GET'
        }).then(response => response.json())
            .then(response => {


                this.setState({utilisateurs: response.data});
            }).catch(function (error) {
            console.log('ERREUR : ' + error.message);
        });
        axios(APP_URL+'/api/routeur/'+'transaction.ajouter.admin', {method: 'GET', data:{'_token': CSRF_TOKEN}}).then(response=>{
            this.setState({url_envoi:response.data});

        }).catch(function(error){
            console.log('ERREUR : '+ error.message);
        });
    }


    recupererComptes(e) {
        const requestsOptions = {
            method: 'POST',
            data: {'_token': CSRF_TOKEN, id: e.target.value}
        }

        var post = axios(APP_URL + '/api/getCompteByUtilisateur', requestsOptions)

            .then(response => {

                this.setState({comptes: response.data});

            }).catch(function (error) {
                console.log('ERREUR : ' + error.message);
            })

    }

    render() {
        return (
            <div className="mt-2">
                <form id="formulaireAjoutOperation" action={this.state.url_envoi} method="post">
                    <input type="hidden" name="_token" value={CSRF_TOKEN}></input>


                <select defaultValue="-1" onChange={this.recupererComptes} className="form-control" name="utilisateur"

                        form="formulaireAjoutOperation">
                    <option hidden disabled value="-1">Faites un choix dans la liste</option>
                    {this.state.utilisateurs.map((item, i) => {

                        return <option value={item.id} key={item.id}>{item.nom}</option>

                    })}
                </select>
                <br/>
                <select defaultValue="-1" className="form-control" name="compte_id"
                        form="formulaireAjoutOperation">
                    <option hidden disabled value="-1"/>
                    {this.state.comptes.map((item, i) => {
                        return <option value={item.id} key={item.id}>{item.nom}</option>

                    })}
                </select>
                <br/>
                    <input type="text" className="form-control" name="montant" placeholder="Montant" ></input>
                <br />
                <button role="submit" className="btn btn-primary" onClick={() => {

                }}>
                    Ajouter
                </button>
                </form>

            </div>
        );
    }

}

export default ListesLieesReact;

// DOM element
if (document.getElementById('listes-liees-react')) {
    ReactDOM.render(<ListesLieesReact
                                      />, document.getElementById('listes-liees-react'));
}