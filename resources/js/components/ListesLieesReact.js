import React from 'react';
import ReactDOM from 'react-dom';

class ListesLieesReact extends React.Component{

    constructor() {
        super();
        this.state = {
            title: "Titre"
        }
    }

    render(){
        return (
            <div className="container m-5">
                <div className="row justify-content-center">
                    <div className="col-md-8">
                        <div className="card text-center">
                            <div className="card-header"><h2>React Component in Laravel</h2></div>

                            <div className="card-body">TESTEEEE {this.state.title}!</div>
                            <button className="square" onClick={() => {
                                this.setState({title: "Whatsup darling"}) ;
                            }}>
                                {this.props.value}
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        );
    }

}

export default ListesLieesReact;

// DOM element
if (document.getElementById('user')) {
    ReactDOM.render(<ListesLieesReact name="PASCAL" value="Bouton bizarre"/>, document.getElementById('listes-liees-react'));
}